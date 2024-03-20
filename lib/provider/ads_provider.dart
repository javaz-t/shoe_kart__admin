import 'dart:io';

import 'package:admin_shoe_kart__/models/ads_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdsProvider extends ChangeNotifier{
   late String uniqeName;
   late String adsUrl;
  bool adsImageUrlGetted = false;


  adsImagePicker() async {
    {
      //pick image form firebase
      ImagePicker imagePicker = ImagePicker();
      XFile? adsFile = await imagePicker.pickImage(source: ImageSource.gallery);

      //add selected image to firebase
      if (adsFile == null) return;
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceAds = referenceRoot.child('ads_images');

      //reference to store the image
       uniqeName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference uploadImage = referenceAds.child(uniqeName);
      //store the file

      try {
        await uploadImage.putFile(File(adsFile.path));
        adsUrl = await uploadImage.getDownloadURL();
        adsImageUrlGetted = true;
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }


   uploadAdsData() async {
     try {
 final docAds =
                FirebaseFirestore.instance.collection('Ads Data').doc(uniqeName);
           final logoData =AdsModel(adsId: uniqeName, adsUrl: adsUrl);
            final json = logoData.toJson();
               await docAds.set(json);
               adsImageUrlGetted =false;
               notifyListeners();
                     } catch (e) {
                        print(e);
                      }
  }
}
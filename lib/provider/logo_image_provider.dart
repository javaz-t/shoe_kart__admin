import 'dart:io';

import 'package:admin_shoe_kart__/models/logo_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LogoImageProvider extends ChangeNotifier {
  TextEditingController logoNameController = TextEditingController();
  late String logoImageUrl;
  late String uniqeName;
  bool logoImageUrlGetted = false;
  pickLogo() async {
    {
      //pick image form firebase
      ImagePicker imagePicker = ImagePicker();
      XFile? adsFile = await imagePicker.pickImage(source: ImageSource.gallery);

      //add selected image to firebase
      if (adsFile == null) return;
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceAds = referenceRoot.child('logo_images');

      //reference to store the image
       uniqeName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference uploadImage = referenceAds.child(uniqeName);
      //store the file

      try {
        await uploadImage.putFile(File(adsFile.path));
        logoImageUrl = await uploadImage.getDownloadURL();
        print(logoImageUrl);
        logoImageUrlGetted = true;
        notifyListeners();
      } catch (e) {
        print(e);
      }
    }
  }

  uploadLogoDetails() async {
     try {
                
                        String logoName = logoNameController.text;
                         final docLogo =
                FirebaseFirestore.instance.collection('logoData').doc(uniqeName);
           final logoData = LogoModel(logoName: logoName, logoUrl: logoImageUrl, id: uniqeName);
            final json = logoData.toJson();
               await docLogo.set(json);
               logoImageUrlGetted =false;
               logoNameController.clear();
               notifyListeners();
                    
                      } catch (e) {
                        print(e);
                      }
  }

   
}

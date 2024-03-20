import 'dart:io';

import 'package:admin_shoe_kart__/models/products_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductDetailsProvider extends ChangeNotifier {
   late String  productDetailsId; 
    final productDetailsKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discoundController = TextEditingController();
  TextEditingController deliveryChargeController = TextEditingController();
   List<String>imageUrlList=[];
    List<String> colors=[];
     List<String> sizes=[];
      List<String> catergory=[];
        String selectedBrand ='Adidas'; 
 bool isImageUrlget= false;
 List<File> selectedImages=[];
 
  productImagePicker() async {
    print("gtrfdrtftyftfRTYUGHJ");
      //pick multi form phone
      ImagePicker imagePicker = ImagePicker();
     List<XFile?> imageList = await imagePicker.pickMultiImage();
     if(imageList==null) return;

      //add selected image to firebase
      Reference referenceRoot = FirebaseStorage.instance.ref();
       Reference referenceImg = referenceRoot.child('productImges');
              productDetailsId = DateTime.now().microsecondsSinceEpoch.toString();
      Reference listRef = referenceImg.child(productDetailsId);
      
                       
                           
                        
      //Reference reference = FirebaseStorage.instance.ref('Product Details');//.child(uniqeName);
      //Reference referenceAds = referenceRoot.child(uniqeName);

      //reference to store the image
      
     // Reference uploadImage = referenceAds.child(uniqeName);
     
      //store the file

   //    String imagesPath = productFile[x]!.path.replaceAll('/', '_');
     //                       Reference uploadImage = listRef.child(imagesPath);
       //                     await uploadImage.putFile(File(productFile[x]!.path));

      //try {
        for(int i =0;i<imageList.length;i++){
      

         // selectedImages.add(File(imageList[i]!.path));
         // print("Image lsit = ${selectedImages[i]}");
          String imagesPath = imageList[i]!.path.replaceAll('/', '_');
          Reference uploadImage = listRef.child(imagesPath);

           await uploadImage.putFile(File(imageList[i]!.path));
                            String indivigualImagesUrl =
                                await uploadImage.getDownloadURL();
                            imageUrlList.add(indivigualImagesUrl);
                              isImageUrlget = true;
                              notifyListeners();
         }
      
      // } catch (e) {
      //   print(e);
      // }
    
  }


  uploadDetails() async {
 final docAds =  FirebaseFirestore.instance.collection('Product Data').doc(productDetailsId);
           final productData =ProductDetails(id: productDetailsId, name: nameController.text, description: descriptionController.text, price:double.parse(priceController.text) ,
            deliveryCharge: double.parse(deliveryChargeController.text), 
            images: imageUrlList, colors: colors, sizes: sizes,
             catergory: catergory, brand: selectedBrand,
              discount: double.parse(discoundController.text));
            final json = productData.toJson();
               await docAds.set(json);
               isImageUrlget  =false;
               clearAll();
               notifyListeners();
          
  }


  clearAll(){
  // Clear text editing controllers
  nameController.clear();
  descriptionController.clear();
  priceController.clear();
  discoundController.clear();
  deliveryChargeController.clear();

  // Clear lists
  imageUrlList.clear();
  colors.clear();
  sizes.clear();
  catergory.clear();

  }



}

import 'package:admin_shoe_kart__/models/ads_model.dart';
import 'package:admin_shoe_kart__/models/logo_model.dart';
import 'package:admin_shoe_kart__/models/products_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference adsRef = FirebaseFirestore.instance.collection('Ads Data');
 

List<AdsModel> adsList=[];
fetchAds() async {
    try {
      QuerySnapshot adsSnapshot = await adsRef.get();
      final List<AdsModel> adsRetreved = adsSnapshot.docs
          .map((doc) => AdsModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      adsList.clear(); 
      adsList.addAll(adsRetreved);
    } catch (e) {
    // print(e);
    } 
  }


//logo dat
 final CollectionReference logoRef =
      FirebaseFirestore.instance.collection('logoData');
      List<LogoModel> logoList=[];
fetchLogo() async {
    try {
      QuerySnapshot adsSnapshot = await logoRef.get();
      final List<LogoModel> logoRetreved = adsSnapshot.docs
          .map((doc) => LogoModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      logoList.clear(); 
      logoList.addAll(logoRetreved);
    } catch (e) {
    // print(e);
    } 
  }

 
List<ProductDetails> productsShowInUI=[];
List<ProductDetails>allProducts=[]; 
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Product Data');
fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<ProductDetails> retrievedProducts = productSnapshot.docs
          .map((doc) => ProductDetails.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      allProducts.clear(); 
      allProducts.addAll(retrievedProducts);
      productsShowInUI.addAll(allProducts);                   
    } catch (e) {
     print(e);
    } 
  }
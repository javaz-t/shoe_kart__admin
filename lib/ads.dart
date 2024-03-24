import 'package:admin_shoe_kart__/core/const.dart';
import 'package:admin_shoe_kart__/functions/display_data.dart';
import 'package:admin_shoe_kart__/models/ads_model.dart';
import 'package:admin_shoe_kart__/provider/ads_provider.dart';
import 'package:admin_shoe_kart__/widgets/buttom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ads extends StatelessWidget {
  const Ads({super.key});

  @override
  Widget build(BuildContext context) {
    var adsRef = FirebaseFirestore.instance.collection('Ads Data');
    return  Consumer<AdsProvider>(
      builder: (context,adsProvider,child)=> SingleChildScrollView(
        child: Column(
          children: [
            kHspace20,
            adsProvider.adsImageUrlGetted==false?
            Container(
              height: 200,width: 300,decoration: BoxDecoration(border:Border.all() ),
              child: Center(child: TextButton(child: Text('Select Images'),onPressed: (){ adsProvider.adsImagePicker();},),),
            ): SizedBox(
              height: 200,width: 300,
              child: Image.network(adsProvider.adsUrl),),
             adsProvider.adsImageUrlGetted? MyButtom(text: 'Submit', onTab: (){adsProvider.uploadAdsData();})
        :DisableButton(text: 'Submit'),
        const Divider(),
       ListView.builder(shrinkWrap: true,itemCount: adsList.length,itemBuilder: (context,index){
        AdsModel data = adsList[index];
       
                          return SizedBox(height: 150,width: double.infinity,
                          child:Row(
                            children: [
                              SizedBox(height: 150,width: 300,child: Image.network(data.adsUrl)),
                              IconButton(onPressed: (){
                                adsRef.doc(data.adsId).delete();
                              }, icon: const Icon(Icons.delete,color: Colors.red,)),      
        
                            ],
                          ) ,);
        
          }),
                 ],
        ),
      ),
    );
  }
}
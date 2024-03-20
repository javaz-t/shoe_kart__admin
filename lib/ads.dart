import 'package:admin_shoe_kart__/core/const.dart';
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
        StreamBuilder(stream: adsRef.snapshots(), builder: (context,snapshot){
           List<QueryDocumentSnapshot<Object?>>
                        adsQueryDocumentSnapshot = snapshot.data!.docs;
          return ListView.builder(shrinkWrap: true,itemCount: adsQueryDocumentSnapshot.length,itemBuilder: (context,index){
              DocumentSnapshot adsDetails =
                          adsQueryDocumentSnapshot[index];
                          return SizedBox(height: 150,width: double.infinity,
                          child:Row(
                            children: [
                              SizedBox(height: 150,width: 300,child: Image.network(adsDetails['adsUrl'])),
                              IconButton(onPressed: (){
                                adsRef.doc(adsDetails['id']).delete();
                              }, icon: const Icon(Icons.delete)),
        
                            ],
                          ) ,);
        
          });
        })
          ],
        ),
      ),
    );
  }
}
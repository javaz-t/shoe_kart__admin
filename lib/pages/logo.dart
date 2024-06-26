import 'package:admin_shoe_kart__/core/const.dart';
import 'package:admin_shoe_kart__/functions/display_data.dart';
import 'package:admin_shoe_kart__/models/logo_model.dart';
import 'package:admin_shoe_kart__/provider/logo_image_provider.dart';
import 'package:admin_shoe_kart__/widgets/buttom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference logoRef =
        FirebaseFirestore.instance.collection('logoData');
    return Consumer<LogoImageProvider>(
      builder: (context, logoProvider, child) => Column(
        children: [
          kHspace20,
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 200,
                height: 45,
                child: TextField(
                  controller: logoProvider.logoNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Enter Logo Name',
                  ),
                ),
              ),
              logoProvider.logoImageUrlGetted
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(logoProvider.logoImageUrl))
                  : GestureDetector(
                      onTap: () async {
                        logoProvider.pickLogo();
                      },
                      child:const  CircleAvatar(
                        radius: 50,
                        child: Text('Add logo'),
                      )),
            ],
          ),
          kHspace20,
          kHspace20,
          logoProvider.logoImageUrlGetted
              ? MyButtom(
                  text: 'Submit',
                  onTab: () async {
                    await logoProvider.uploadLogoDetails();
                  },
                )
              :const  DisableButton(text: 'Submit'),
          const Divider(),
          Expanded(
            child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: logoList.length,
                      itemBuilder: (context, index) {
                       LogoModel data = logoList[index];
                        return Container(
                            height: 80,
                            margin: const EdgeInsets.all(5),
                            child: Card(
                                child: ListTile(
                              title: Text(data.logoName),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(data.logoUrl),
                                backgroundColor: Colors.amber,
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  logoRef.doc(data.id).delete();
                                },
                              ),
                            )));
                      }),
      )
      ],
      ),
    );
  }
}

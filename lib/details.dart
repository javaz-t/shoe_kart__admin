import 'package:admin_shoe_kart__/core/const.dart';
import 'package:admin_shoe_kart__/provider/product_details_provider.dart';
import 'package:admin_shoe_kart__/widgets/buttom.dart';
import 'package:admin_shoe_kart__/widgets/custom_text_field.dart';
import 'package:admin_shoe_kart__/widgets/multi_select.dart';
import 'package:admin_shoe_kart__/widgets/select_brand.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final detailRef = FirebaseFirestore.instance.collection('Produc Data');
    return Consumer<ProductDetailsProvider>(
      builder: (context, detlsCtrl, child) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: detlsCtrl.productDetailsKey,
            child: Column(
              children: [
                kHspace20,
                OutlinedButton(
                    onPressed: () async {
                      detlsCtrl.productImagePicker();
                    },
                    child: const Text('Pick Product Images')),
                kHspace20,
                CustomTextField(
                  controller: detlsCtrl.nameController,
                  hintText: 'Enter Product Name',
                  validator: (val) {
                    if (detlsCtrl.nameController.text.isEmpty) {
                      return 'Enter a name ';
                    }
                    return null;
                  },
                ),
                kHspace20,
                BrandSelecter(
                  brandsList: brands,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: detlsCtrl.descriptionController,
                  hintText: 'Enter Product Desciption',
                  validator: (val) {
                    if (detlsCtrl.descriptionController.text.isEmpty) {
                      return 'Enter a description ';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: detlsCtrl.priceController,
                  hintText: 'Enter Product Price',
                  validator: (val) {
                    if (detlsCtrl.priceController.text.isEmpty) {
                      return 'Enter a price  ';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: detlsCtrl.discoundController,
                  hintText: 'Enter Product Discoud',
                  validator: (val) {
                    if (detlsCtrl.discoundController.text.isEmpty) {
                      return 'Enter a discoud %  ';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: detlsCtrl.deliveryChargeController,
                  hintText: 'Enter Product Delivary charge',
                  validator: (val) {
                    if (detlsCtrl.deliveryChargeController.text.isEmpty) {
                      return 'Enter a delivaty charge  ';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                MultiSelect(
                  optionList: colors,
                  listType: 'Colors',
                  addSelectedValueList: detlsCtrl.colors,
                ),
                const SizedBox(
                  height: 20,
                ),
                MultiSelect(
                  optionList: sizes,
                  listType: 'Size',
                  addSelectedValueList: detlsCtrl.sizes,
                ),
                const SizedBox(
                  height: 20,
                ),
                MultiSelect(
                  optionList: category,
                  listType: 'Category',
                  addSelectedValueList: detlsCtrl.catergory,
                ),
                const SizedBox(
                  height: 20,
                ),
                detlsCtrl.isImageUrlget
                    ? SizedBox(
                        height: 200,
                        child: StreamBuilder(
                          stream: detailRef.snapshots(),
                          builder: (context, snapshot) {
                            List<QueryDocumentSnapshot<Object?>>
                                productQueryDocumentSnapshot =
                                snapshot.data!.docs;
                            return ListView.builder(
                                itemCount: productQueryDocumentSnapshot.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot productDetals =
                                      productQueryDocumentSnapshot[index];
                                  return Container(
                                    margin: const EdgeInsets.all(5),
                                    height: 200,
                                    width: 200,                             
                                    color: Colors.amber,
                                     child: Image.network(
                                        productDetals['images'][index]),
                                  );
                                });
                          },
                        ),
                      )
                    : const SizedBox(),
                detlsCtrl.isImageUrlget
                    ? MyButtom(
                        text: 'submit',
                        onTab: () {
                          detlsCtrl.uploadDetails();
                        })
                    : const DisableButton(text: 'submit')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:admin_shoe_kart__/core/const.dart';
import 'package:admin_shoe_kart__/provider/product_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandSelecter extends StatefulWidget {
  final List<String> brandsList;

  const  BrandSelecter({super.key,  required this.brandsList});

  @override
  State<BrandSelecter> createState() => _BrandSelecterState();
}

class _BrandSelecterState extends State<BrandSelecter> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        kVspace20,
        Text('Select Brand',style: TextStyle(fontWeight: FontWeight.bold),),
        kVspace20,
        Container(
          height: 60,width: 300,decoration: BoxDecoration(border: Border.all()),
          child: Center(
            child: Consumer<ProductDetailsProvider>(
              builder: (context,detslCtrl,child)=>
             DropdownButton(
                dropdownColor: Colors.white,
                focusColor: Colors.white,
                    // Value initially set to null, change it to a default value if needed
                    value: detslCtrl.selectedBrand,
                    // Callback function to handle dropdown item selection
                    onChanged: (newValue) {
                      
                      setState(() {
                     if(newValue!.isNotEmpty)  detslCtrl.selectedBrand =newValue;
                      });
                    },
                    // Create dropdown items from the list of items
                    items: brands.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
            ),
          ),
        ),
      ],
    );
    
  }
}
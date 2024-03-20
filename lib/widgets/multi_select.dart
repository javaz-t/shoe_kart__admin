import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class MultiSelect extends StatefulWidget {
  final String listType;
  final List<String> optionList;
  final List<String>addSelectedValueList;
 

   MultiSelect({super.key, required this.optionList,  required this.listType,required this.addSelectedValueList,});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
    List <String> selectedList=[];
  @override
  Widget build(BuildContext context) {
    return DropDownMultiSelect(
            decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.onPrimary,
              focusColor: Theme.of(context).colorScheme.onPrimary,
              enabledBorder:  const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5
                  )),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    color:Colors.blue,
                    width: 1.5,
                  )),
            ),
            
           validator: (val) {
    if (val == null || val.isEmpty) {
      return 'Please select at least one value';
    }
    return '';
  },
            options: widget.optionList,
            selectedValues: widget.addSelectedValueList,
            onChanged: (List<String> value) {
               },
            whenEmpty: 'Select ${widget.listType}',
          );
  }
}
import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
  final String text;
  final Function()onTab;
  const MyButtom({super.key, required this.text, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20 ,vertical: 10)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
    ),
  ),
  onPressed: () {
    onTab();
  },
  child: Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20 ,
    ),
  ),
);
  }
}

class DisableButton extends StatelessWidget {
  final String text;
  const DisableButton({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 146, 154, 161)),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20 ,vertical: 10)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
    ),
  ),
  onPressed: () {
   
  },
  child: Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20 ,
    ),
  ),
);
  }
}
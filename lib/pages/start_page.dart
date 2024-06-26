import 'package:admin_shoe_kart__/pages/ads.dart';
import 'package:admin_shoe_kart__/pages/details.dart';
import 'package:admin_shoe_kart__/functions/display_data.dart';
import 'package:admin_shoe_kart__/pages/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    // TODO: implement initState
    fetchAds();
    fetchLogo();
    fetchProduct(); 
    super.initState();
  }
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title:const Text('Admin',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),),
        body:const  Column(
          children: [
            TabBar(tabs: [
              Tab(text: 'Logo',),
                Tab(text: 'Adds',),
                  Tab(text: 'Details ',),

            ]),
            
            Expanded(
              child: TabBarView(children:[
               Logo(),
               Ads(),
               Details()
                
              ]),
            )
          ],
        ),
      ),
    );
  }
}


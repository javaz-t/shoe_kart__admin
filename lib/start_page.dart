import 'package:admin_shoe_kart__/ads.dart';
import 'package:admin_shoe_kart__/details.dart';
import 'package:admin_shoe_kart__/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
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

class Adds {
}
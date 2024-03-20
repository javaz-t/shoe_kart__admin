import 'package:admin_shoe_kart__/firebase_options.dart';
import 'package:admin_shoe_kart__/provider/ads_provider.dart';
import 'package:admin_shoe_kart__/provider/logo_image_provider.dart';
import 'package:admin_shoe_kart__/provider/product_details_provider.dart';
import 'package:admin_shoe_kart__/start_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>LogoImageProvider()),
        ChangeNotifierProvider(create: (context)=>AdsProvider()),
         ChangeNotifierProvider(create: (context)=>ProductDetailsProvider()),
      ],
      child: const MaterialApp(
        home: StartPage(),
      ),
    );
  }
}
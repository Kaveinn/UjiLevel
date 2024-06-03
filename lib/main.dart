import 'package:flutter/material.dart';
import 'package:flutter_application_widget1/components/my_drawer.dart'
    as MyDrawer; // Aliaskan impor my_drawer.dart
import 'package:flutter_application_widget1/models/shop.dart';
import 'package:flutter_application_widget1/pages/cart_page.dart';
import 'package:flutter_application_widget1/pages/shop_page.dart'
    as ShopPage; // Aliaskan impor shop_page.dart
import 'package:flutter_application_widget1/themes/light_mode.dart';
import 'package:provider/provider.dart';
import 'pages/intro_page.dart';
import 'pages/onboarding_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      theme: lightMode,
      routes: {
        '/onboarding_screen': (context) => OnboardingScreen(),
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage
            .ShopPage(), // Gunakan alias untuk mengakses ShopPage dari shop_page.dart
        '/cart_page': (context) => CartPage(),
      },
    );
  }
}

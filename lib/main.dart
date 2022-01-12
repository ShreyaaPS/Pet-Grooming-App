import 'package:petgrooming/CartPage.dart';
import 'package:petgrooming/Login.dart';
import 'package:petgrooming/SignUp.dart';
import 'package:petgrooming/booking.dart';
import 'package:petgrooming/details.dart';
import 'package:petgrooming/feedback_screen.dart';
import 'Hair.dart';
import 'package:flutter/material.dart';
import 'package:petgrooming/hairstyles.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petgrooming/cart.dart';
import 'package:petgrooming/Services.dart';
import 'package:petgrooming/Spa.dart';
import 'package:petgrooming/Bath.dart';
import 'package:petgrooming/HomePage.dart';
import 'package:petgrooming/Start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "Login": (BuildContext context) => Login(),
        "SignUp": (BuildContext context) => SignUp(),
        "start": (BuildContext context) => Start(),
        cart.routeName: (_) => cart(),
        Services.routeName: (_) => Services(),
        hairstyles.routeName: (_) => hairstyles(),
        Spa.routeName: (_) => Spa(),
        Bath.routeName: (_) => const Bath(),
        HomePage.routeName: (_) => HomePage(),
        Hair.routeName: (_) => Hair(),
        details.routeName: (_) => details(),
        FeedbackScreen.routeName: (_) => FeedbackScreen(),
        CartPage.routeName: (_) => CartPage(),
      },
    );
  }
}

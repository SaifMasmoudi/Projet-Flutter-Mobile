
import 'package:flutter/material.dart';
import 'package:projetflutter/Khadija/home.dart';
import 'package:projetflutter/Saif/home.dart';
import 'package:projetflutter/home.dart';



import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = {

    '/home':(context)=>HomePage(),
    '/saifhome':(context)=>HomeSaif(),
    '/khadijahome':(context)=>HomeKhadija(),


  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home', // Définir la page d'accueil
      routes: routes,

    );
  }
}

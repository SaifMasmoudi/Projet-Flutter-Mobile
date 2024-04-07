
import 'package:flutter/material.dart';
import 'package:projetflutter/Khadija/home.dart';
import 'package:projetflutter/Saif/home.dart';
import 'package:projetflutter/authentification/login.dart';
import 'package:projetflutter/authentification/register.dart';
import 'package:projetflutter/authentification/welcome.dart';
import 'package:projetflutter/home.dart';



import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = {

    '/home':(context)=>HomePage(),
    '/saifhome':(context)=>NavigationExample(),
    '/khadijahome':(context)=>HomeKhadija(),
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/welcome': (context) => WelcomePage(),


  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome', // Définir la page d'accueil
      routes: routes,
    );
  }
}

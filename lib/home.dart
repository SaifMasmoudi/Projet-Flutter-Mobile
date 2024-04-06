import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Wrap(
                spacing: 20.0, // Espacement horizontal entre les éléments
                runSpacing: 20.0, // Espacement vertical entre les lignes
                children: [
                  InkWell(
                    child: Ink.image(
                      height: 180,
                      width: 180,
                      image: AssetImage('images/saif.png'),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/saifhome');
                    },
                  ),
                  InkWell(
                    child: Ink.image(
                      height: 180,
                      width: 180,
                      image: AssetImage('images/khadija.png'),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/khadijahome');
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20), // Espacement entre les images et le bouton
          ElevatedButton(
            onPressed: () => _Deconnexion(context),
            child: Text("Déconnexion"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 02),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20), // Espacement entre le bouton et le bas de l'écran
        ],
      ),
    );
  }

  Future<void> _Deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/authentification', (Route<dynamic> route) => false);
  }
}

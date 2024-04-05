import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Center(
        child: Wrap(
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
    );
  }

}

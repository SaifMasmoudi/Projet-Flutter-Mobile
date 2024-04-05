import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_psw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AuthentificationPage'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_login,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Utilisateur",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                controller: txt_psw,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                onPressed: () {
                  _onLogin(context);
                },
                child: Text("Login", style: TextStyle(fontSize: 22)),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/inscription');
              },
              child: Text("New user", style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
      ),
    );
  }

  void _onLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String inscritLogin = prefs.getString("login") ?? "";
    String inscritPassword = prefs.getString("password") ?? "";

    if (txt_login.text == inscritLogin && txt_psw.text == inscritPassword) {
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } else {
      const snackBar = SnackBar(content: Text('Identifiant ou mot de passe incorrect'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
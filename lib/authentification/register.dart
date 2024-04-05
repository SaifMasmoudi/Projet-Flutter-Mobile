import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_psw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InscriptionPage'),
        backgroundColor: Colors.green, // Changer la couleur de l'AppBar en vert
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
                  hintText: "Identifiant",
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
                    onPressed: (){
                      _onInscrire(context);
                    },
                    child: Text('Inscription' , style: TextStyle(fontSize: 22),))
            ),
            TextButton(onPressed: (){
              // SI JE VEUT FERMER LA PAGE INSCRIPTION
              Navigator.pop(context);
              Navigator.pushNamed(context, '/authentification');

            }, child:Text("J'ai un compte" , style: TextStyle(fontSize: 22),))
          ],
        ),
      ),
    );
  }

  void _onInscrire(BuildContext context) async{
    prefs= await SharedPreferences.getInstance();
    if(!txt_login.text.isEmpty && !txt_login.text.isEmpty){
      prefs.setString("login", txt_login.text);
      prefs.setString("password", txt_psw.text);
      prefs.setBool('connecte', true);
      Navigator.pop(context);
      Navigator.pushNamed(context,'/home');
    }
    else{
      const snackBar=SnackBar(
        content: Text('Id ou mot de passe vides'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
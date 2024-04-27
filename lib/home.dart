import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:projetflutter/provider/theme_provider.dart';
class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Page Accueil'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _deconnexion(context),
          ),

        ],
      ),
      //backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Bienvenue',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 40),
              Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                alignment: WrapAlignment.center,
                children: [
                  _buildUserImage(
                    imagePath: 'images/saif.png',
                    onTap: () => Navigator.pushNamed(context, '/saifhome'),
                  ),
                  _buildUserImage(
                    imagePath: 'images/khadija.png',
                    onTap: () => Navigator.pushNamed(context, '/khadijahome'),
                  ),
                ],
              ),

              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserImage({required String imagePath, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/authentification', (Route<dynamic> route) => false);
  }
}

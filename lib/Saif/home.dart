import 'package:flutter/material.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil de saif'),

        actions: [
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Contacter Moi"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Email : saifmasmoudi7@gmail.com"),
                        Text("Numero Telephonne : 95100844 "),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add_location_outlined),
            onPressed: () => {},
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Accueil',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.school)),
            label: 'Compétences',
          ),
          NavigationDestination(
            icon: Badge(

              child: Icon(Icons.interpreter_mode_rounded),
            ),
            label: 'Expériences',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.account_balance_wallet_rounded),
            ),
            label: 'Portfolio',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            if (currentPageIndex == 0)
              Column(
                children: [
                  Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.white60,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('images/saif.png'),
                          ),
                          SizedBox(height: 50),
                          Text(
                            'masmoudi saif, 23 ans, étudiant en 2ème année de génie logiciel à l\'Institut International de Technologie spécialisé en génie logiciel et informatique décisionnel',
                            style: theme.textTheme.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Espacement entre la carte et l'image
                  Image.asset('images/portfolio/iit.png', width:180,height:100), // Remplacez 'votre_image.png' par le chemin de votre image
                ],
              ),

            if (currentPageIndex == 1)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //SizedBox(height: 3),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/saif.png'),
                    ),
                    //SizedBox(height: 16),
                    Text(
                      'Compétences en Informatique:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    _buildSkillItem('Java', 0.8),
                    _buildSkillItem('Flutter', 0.7),
                    _buildSkillItem('Python', 0.9),
                    _buildSkillItem('HTML/CSS', 0.8),
                    _buildSkillItem('JavaScript', 0.7),
                    _buildSkillItem('SQL', 0.8),
                    SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Certifications:',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCertificationItem('CCNA'),
                                SizedBox(height: 8), // Ajouter un espace entre le texte et l'image
                                Image.asset('images/portfolio/ccna.jpg', width: 130, height: 130), // Ajouter CCNA certification image
                              ],
                            ),
                            SizedBox(width: 50), // Ajuster l'espacement entre les éléments
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildCertificationItem('Scrum'),
                                SizedBox(height: 8), // Ajouter un espace entre le texte et l'image
                                Image.asset('images/portfolio/certsaif.png', width: 130, height: 130), // Ajouter CCNA certification image
                                // Ajouter CCNA certification image
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            if (currentPageIndex == 2)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5), // Ajouter un espace
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/saif.png'), // Remplacez par votre chemin d'image
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Expérience Professionnelle',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildStageItem('ASM', 'stage pfe', '2022','Application de gestion de repartition,c# .net'),
                          _buildStageItem('Informatique bussiness solution (IBS)', 'stage pfa', '2021','Site Web, hmtl css js bootstrap'),
                          _buildStageItem('systeo digital', 'stage été', '2023','symfony:app web'),


                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('images/asm1.png', width: 90, height: 90),
                        Image.asset('images/systeo1.png', width: 90, height:90),
                        Image.asset('images/ibs1.png', width: 90, height:90),
                      ],
                    ),
                  ],
                ),
              ),
            if (currentPageIndex == 3)

              Padding(
                padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/angular.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Angular Project',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/laravel.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Laravel+vs Project',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/asp.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'ASP.NET Project',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/flutter.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Flutter Project',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/symfony.png',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Symfony project',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Card(
                                  child: Image.asset(
                                    'images/portfolio/ia.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'IA Project',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillItem(String skillName, double skillLevel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              skillName,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 10,
              child: LinearProgressIndicator(
                value: skillLevel,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationItem(String certificationName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8),
          Text(
            certificationName,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildStageItem(String entreprise, String poste, String annee,String sujet) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          '$entreprise - $poste ($annee) - $sujet',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

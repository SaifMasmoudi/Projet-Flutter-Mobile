import 'package:flutter/material.dart';

class HomeKhadija extends StatefulWidget {
  const HomeKhadija({Key? key}) : super(key: key);

  @override
  State<HomeKhadija> createState() => _HomeKhadijaState();
}

class _HomeKhadijaState extends State<HomeKhadija> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil de Khadija'),

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
                        Text("Email : khadijaabdelmoula5@gmail.com"),
                        Text("Numero Telephonne : 54010757 "),
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
              label: Text('2'),
              child: Icon(Icons.key),
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
            SizedBox(height: 80),
            if (currentPageIndex == 0)
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
                        backgroundImage: AssetImage('images/khadija.png'),
                      ),
                      SizedBox(height: 80),
                      Text(
                        'Khadija Abdelmoula, 23 ans, étudiante en 2ème année de génie logiciel à l\'Institut International de Technologie spécialisé en génie logiciel et informatique décisionnel',
                        style: theme.textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            if (currentPageIndex == 1)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/khadija.png'),
                    ),
                    SizedBox(height: 16),
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
                        _buildCertificationItem('CCNA'),
                        _buildCertificationItem('Scrum '),
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
                      backgroundImage: AssetImage('images/khadija.png'), // Remplacez par votre chemin d'image
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Expérience Professionnelle',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildStageItem('primatec engineering', 'stage pfa', '2021','jira software'),
                          _buildStageItem('primatec engineering', 'stage pfe', '2022','unity 3d'),
                          _buildStageItem('systeo digital', 'stage été', '2023','symfony:app web'),
                        ],
                      ),
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
                                    'images/portfolio/1.png',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Description de l\'image 1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
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
                                    'images/portfolio/1.png',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Description de l\'image 2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
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
                                    'images/portfolio/1.png',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Description de l\'image 3',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
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
                                    'images/portfolio/1.png',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Description de l\'image 4',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
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

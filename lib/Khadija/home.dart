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
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Compétences',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 80), // Ajout d'un espace supplémentaire en haut
            /// Page d'accueil
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
                        backgroundImage: AssetImage('images/khadija.png'), // Remplacez par le chemin de votre image
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

            /// Page de notifications
            if (currentPageIndex == 1)
              Column(
                children: <Widget>[
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.notifications_sharp),
                      title: Text('Notification 1'),
                      subtitle: Text('Ceci est une notification'),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.notifications_sharp),
                      title: Text('Notification 2'),
                      subtitle: Text('Ceci est une notification'),
                    ),
                  ),
                ],
              ),

            /// Page de messages
            if (currentPageIndex == 2)
              ListView.builder(
                reverse: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        index == 0 ? 'Bonjour' : 'Salut!',
                        style: theme.textTheme.subtitle1,
                      ),
                      tileColor: index == 0 ? theme.colorScheme.primary : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  );
                },
              ),

            /// Contact information
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Contactez-moi:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Email: abdelmoulakhadija4@gmail.com',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Téléphone: +12654010757',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

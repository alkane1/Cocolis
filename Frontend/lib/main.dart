import 'package:flutter/material.dart';
import 'screens/Accueil.dart';
import 'screens/PublishTripScreen.dart';
import 'screens/Colis.dart';
import 'screens/Messages.dart';
import 'screens/Profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SenColis',
      theme: ThemeData(
        // Utilisez useMaterial3: true pour un thème moderne
        colorSchemeSeed: Colors.teal, // Couleur principale (Teal)
        useMaterial3: true,
      ),
      // L'application commence par l'écran qui gère la navigation
      home: MainScreen(),
    );
  }
}

// ----------------------------------------------------
// NOUVELLE CLASSE POUR GÉRER LA NAVIGATION (BottomNavBar)
// ----------------------------------------------------
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Liste des écrans correspondants aux onglets du bas
  static List<Widget> _widgetOptions = <Widget>[
    // Accueil/Rechercher
    Accueil(),
    // Publier
    PublishTripScreen(),
    // Vos Colis (Nous allons utiliser une version sans les arguments inutiles ici)
    VosColisScreen(),
    // Messages
    const Messages(
      interlocutorName: 'Nom du Voyageur Factice', // Valeur String requise
      parcelContext: 'Colis vers Lyon (5kg)',     // Valeur String requise
    ),
    // Profil
    ProfilScreen(),
    Center(child: Text('Page Profil (WIP)')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Affiche la page sélectionnée
      body: _widgetOptions.elementAt(_selectedIndex),

      // Barre de navigation du bas
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Rechercher'),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: 'Publier'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'Vos Colis'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary, // Utilisation de la couleur principale
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Important pour 5 éléments
      ),
    );
  }
}
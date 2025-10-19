import 'package:flutter/material.dart';

// Modèle de données simplifié
class Colis {
  final String titre;
  final String utilisateurPartenaire; // Expéditeur ou Transporteur
  final String statut;
  final IconData iconeStatut;

  Colis({required this.titre, required this.utilisateurPartenaire, required this.statut, required this.iconeStatut});
}

// Les données de démonstration
final List<Colis> mesEnvois = [
  Colis(titre: "Colis vers Bordeaux (4kg)", utilisateurPartenaire: "Par Jean D.", statut: "En Transit", iconeStatut: Icons.local_shipping),
  Colis(titre: "Courrier vers Lyon", utilisateurPartenaire: "Par Marie T.", statut: "Livré", iconeStatut: Icons.done_all),
];

final List<Colis> mesTransports = [
  Colis(titre: "Colis de Paris à Nice", utilisateurPartenaire: "Pour Luc S.", statut: "Accepté", iconeStatut: Icons.check_circle),
  Colis(titre: "Demande de Rennes à Nantes", utilisateurPartenaire: "Pour Julie K.", statut: "En attente", iconeStatut: Icons.hourglass_bottom),
];


class VosColisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Utiliser DefaultTabController pour les onglets
    return DefaultTabController(
      length: 2, // Nombre d'onglets (Mes Envois, Mes Transports)
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vos Colis'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Mes Envois', icon: Icon(Icons.send)),
              Tab(text: 'Mes Transports', icon: Icon(Icons.drive_eta)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Premier onglet : Mes Envois
            _buildColisList(context, mesEnvois),

            // Deuxième onglet : Mes Transports
            _buildColisList(context, mesTransports),
          ],
        ),
      ),
    );
  }

  // Widget réutilisable pour afficher les listes de colis
  Widget _buildColisList(BuildContext context, List<Colis> colisList) {
    if (colisList.isEmpty) {
      return const Center(
        child: Text(
          "Aucun colis en cours ici.",
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: colisList.length,
      itemBuilder: (context, index) {
        final colis = colisList[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: ListTile(
            leading: Icon(colis.iconeStatut, color: Theme.of(context).primaryColor),
            title: Text(
              colis.titre,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(colis.utilisateurPartenaire),
            trailing: Chip(
              label: Text(colis.statut),
              backgroundColor: colis.statut.contains('Livré') ? Colors.green.shade100 : Colors.blue.shade100,
            ),
            onTap: () {
              // Action : Naviguer vers la page de détails du colis
              print('Ouverture des détails pour : ${colis.titre}');
            },
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Co-Colis'),
        centerTitle: true,
      ),
      // ----------------------
      // 1. Le Corps de la Page
      // ----------------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Trouvez un voyageur pour votre colis.",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Champ de Départ
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Lieu de Départ',
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Champ de Destination
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Destination',
                prefixIcon: Icon(Icons.flag),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),

            // Bouton de Recherche
            ElevatedButton.icon(
              icon: const Icon(Icons.search),
              label: const Text(
                'Rechercher un Voyageur',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                // Logique de recherche ici
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
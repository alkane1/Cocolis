import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
// ... (modèles de données pour les messages)

class Messages extends StatelessWidget {
  final String interlocutorName;
  final String parcelContext;

  const Messages({super.key, required this.interlocutorName, required this.parcelContext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(interlocutorName),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline), // Détails du colis/trajet
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // 1. Bannière d'Information (Contexte du Colis)
          Container(
            padding: const EdgeInsets.all(12),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    parcelContext,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Confirmer l\'Accord'), // Action contextuelle
                ),
              ],
            ),
          ),

          // 2. Zone de Défilement des Messages
          Expanded(
            child: ListView.builder(
              reverse: true, // Pour afficher les derniers messages en bas
              itemCount: 10, // Utiliser la taille réelle de la liste des messages
              itemBuilder: (context, index) {
                // Widget pour construire les bulles de chat (ChatBubble)
                // Ici, une simple bulle de démonstration:
                final isMe = index % 2 == 0; // Alterner pour la démo
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isMe ? Theme.of(context).primaryColor : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Message de démo $index',
                      style: TextStyle(color: isMe ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),

          // 3. Zone de Saisie
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            color: Colors.white,
            child: SafeArea( // S'assurer que la zone n'est pas sous la barre système
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: () { /* Ouvre la sélection de fichiers */ },
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Écrire un message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        maxLines: null, // Permet plusieurs lignes
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
                    onPressed: () { /* Logique d'envoi du message */ },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
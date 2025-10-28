import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Mon Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Déconnexion',
            onPressed: () {
              // TODO: Ajouter la logique de déconnexion
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 20),
            _buildStatsCard(context),
            const SizedBox(height: 30),
            _buildSectionTitle('Gestion du Compte'),
            _buildSettingsList(context),
            const SizedBox(height: 30),
            _buildSectionTitle('Avis et Support'),
            _buildReviewSupportList(context),
          ],
        ),
      ),
    );
  }

  // --- HEADER PROFIL ---
  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 45,
            backgroundColor: Colors.teal,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text(
            'Abdou Latif KANE',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            'abdoulatif@email.com',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, color: Colors.amber, size: 20),
              SizedBox(width: 4),
              Text('4.8', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 4),
              Text('(25 avis)', style: TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              _buildBadge(Icons.verified, 'Identité vérifiée', Colors.green),
              _buildBadge(Icons.date_range, 'Membre depuis 2023', Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  // --- BADGE ---
  static Widget _buildBadge(IconData icon, String label, Color color) {
    return Chip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(label),
      backgroundColor: color.withOpacity(0.1),
    );
  }

  // --- STATISTIQUES ---
  Widget _buildStatsCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatItem(count: '15', label: 'Colis Livrés'),
            _StatItem(count: '8', label: 'Envois Réussis'),
            _StatItem(count: '3', label: 'Trajets Actifs'),
          ],
        ),
      ),
    );
  }

  // --- TITRE DE SECTION ---
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  // --- LISTE DES PARAMÈTRES ---
  Widget _buildSettingsList(BuildContext context) {
    return Column(
      children: [
        _buildProfileTile(context, 'Modifier Mon Profil', Icons.edit, () {}),
        _buildProfileTile(context, 'Paiements', Icons.credit_card, () {}),
        _buildProfileTile(context, 'Sécurité', Icons.lock, () {}),
      ],
    );
  }

  // --- LISTE SUPPORT / AVIS ---
  Widget _buildReviewSupportList(BuildContext context) {
    return Column(
      children: [
        _buildProfileTile(context, 'Historique des Trajets', Icons.history, () {}),
        _buildProfileTile(context, 'Mes Avis', Icons.reviews, () {}),
        _buildProfileTile(context, 'Aide & Support', Icons.help_outline, () {}),
        _buildProfileTile(context, 'Conditions Générales', Icons.gavel, () {}),
      ],
    );
  }

  // --- TILE RÉUTILISABLE ---
  Widget _buildProfileTile(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

// --- WIDGET STATISTIQUE ---
class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: Colors.grey.shade600)),
      ],
    );
  }
}

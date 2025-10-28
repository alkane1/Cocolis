import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Pour le formatage de la date

class PublishTripScreen extends StatefulWidget {
  const PublishTripScreen({super.key});

  @override
  State<PublishTripScreen> createState() => _PublishTripScreenState();
}

class _PublishTripScreenState extends State<PublishTripScreen> {
  final _formKey = GlobalKey<FormState>();
  final _departController = TextEditingController();
  final _destinationController = TextEditingController();
  final _dateDepartController = TextEditingController();
  final _dateArriveeController = TextEditingController();
  final _poidsController = TextEditingController();
  final _prixController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _espaceDisponible;

  // Fonction pour sélectionner une date
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
      locale: const Locale("fr", "FR"),
    );

    if (pickedDate != null) {
      setState(() {
        controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Proposer un trajet'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // --- TITRE SECTION 1 ---
              Text('Où et quand voyagez-vous ?',
                  style: theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              // Ville de départ
              TextFormField(
                controller: _departController,
                decoration: const InputDecoration(
                  labelText: 'Ville de départ',
                  prefixIcon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Entrez la ville de départ' : null,
              ),
              const SizedBox(height: 15),

              // Destination
              TextFormField(
                controller: _destinationController,
                decoration: const InputDecoration(
                  labelText: 'Destination finale',
                  prefixIcon: Icon(Icons.flag_outlined),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Entrez la destination' : null,
              ),
              const SizedBox(height: 15),

              // Dates de départ et d'arrivée
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dateDepartController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Date de départ',
                        prefixIcon: const Icon(Icons.calendar_today),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onTap: () => _selectDate(context, _dateDepartController),
                      validator: (value) => value!.isEmpty ? 'Choisissez une date' : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _dateArriveeController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Date d’arrivée',
                        prefixIcon: const Icon(Icons.calendar_month),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onTap: () => _selectDate(context, _dateArriveeController),
                      validator: (value) => value!.isEmpty ? 'Choisissez une date' : null,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              Divider(color: Colors.grey.shade400, thickness: 1),
              const SizedBox(height: 20),

              // --- TITRE SECTION 2 ---
              Text('Quel espace pouvez-vous offrir ?',
                  style: theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              // Dropdown espace disponible
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Espace disponible',
                  prefixIcon: Icon(Icons.inventory_2_outlined),
                  border: OutlineInputBorder(),
                ),
                value: _espaceDisponible,
                items: ['Petit', 'Moyen', 'Grand'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _espaceDisponible = value),
                validator: (value) => value == null ? 'Sélectionnez un espace' : null,
              ),
              const SizedBox(height: 15),

              // Poids maximum
              TextFormField(
                controller: _poidsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Poids maximum (kg)',
                  prefixIcon: Icon(Icons.scale),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Entrez le poids maximum' : null,
              ),
              const SizedBox(height: 15),

              // Prix par kg
              TextFormField(
                controller: _prixController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Prix par kg (€)',
                  prefixIcon: Icon(Icons.euro),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Entrez un prix' : null,
              ),

              const SizedBox(height: 30),
              Divider(color: Colors.grey.shade400, thickness: 1),
              const SizedBox(height: 20),

              // --- SECTION 3 ---
              Text('📝 Détails du trajet',
                  style: theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description du trajet et conditions',
                  hintText: 'Ex : Je voyage en voiture, j’accepte les objets non fragiles...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
              ),

              const SizedBox(height: 40),

              // --- BOUTON ---
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text('Publier le trajet', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('🚗 Trajet publié avec succès !')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

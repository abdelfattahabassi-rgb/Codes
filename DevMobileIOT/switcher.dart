import 'package:flutter/material.dart';

void main() {
  runApp(const MonApplication());
}

// Application principale
class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commande IoT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const PageLampe(),
    );
  }
}

// Page de commande de la lampe
class PageLampe extends StatefulWidget {
  const PageLampe({super.key});

  @override
  State<PageLampe> createState() => _PageLampeState();
}

class _PageLampeState extends State<PageLampe> {
  // Etat initial de la lampe
  bool lampeAllumee = false;

  // Nombre de changements d'etat
  int nombreCommandes = 0;

  // Fonction de commande de la lampe
  void changerEtat(bool nouvelEtat) {
    setState(() {
      lampeAllumee = nouvelEtat;
      nombreCommandes++;
    });

    // Simulation d'une commande IoT
    if (nouvelEtat) {
      print("Commande MQTT : ALLUMER la lampe");
    } else {
      print("Commande MQTT : ETEINDRE la lampe");
    }
  }

  // Fonction de reinitialisation
  void reinitialiser() {
    setState(() {
      lampeAllumee = false;
      nombreCommandes = 0;
    });

    print("Reinitialisation de la lampe");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre superieure
      appBar: AppBar(
        title: const Text("Domotique - Commande IoT"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      // Contenu principal
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Titre
              const Text(
                "Controle de la lampe",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              // Icone dynamique
              Icon(
                lampeAllumee ? Icons.lightbulb : Icons.lightbulb_outline,
                size: 130,
                color: lampeAllumee ? Colors.orange : Colors.grey,
              ),

              const SizedBox(height: 20),

              // Affichage de l'etat
              Text(
                lampeAllumee ? "Lampe ALLUMEE" : "Lampe ETEINTE",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: lampeAllumee ? Colors.green : Colors.red,
                ),
              ),

              const SizedBox(height: 25),

              // Interrupteur
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("OFF", style: TextStyle(fontSize: 18)),

                  const SizedBox(width: 10),

                  Switch(
                    value: lampeAllumee,
                    onChanged: changerEtat,
                    activeThumbColor: Colors.green,
                  ),

                  const SizedBox(width: 10),

                  const Text("ON", style: TextStyle(fontSize: 18)),
                ],
              ),

              const SizedBox(height: 30),

              // Carte du compteur
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        "Nombre de changements",
                        style: TextStyle(fontSize: 17),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "$nombreCommandes",
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Bouton de reinitialisation
              ElevatedButton.icon(
                onPressed: reinitialiser,
                icon: const Icon(Icons.refresh),
                label: const Text("Reinitialiser"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


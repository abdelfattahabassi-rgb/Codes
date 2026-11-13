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
      debugShowCheckedModeBanner: false,
      home: const PageCompteur(),
    );
  }
}

// Page du compteur
class PageCompteur extends StatelessWidget {
  const PageCompteur({super.key});

  // Stream qui emet une valeur chaque seconde
  Stream<int> genererCompteur() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exemple StreamBuilder"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: StreamBuilder<int>(
          stream: genererCompteur(),

          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            return Text(
              "Compteur : ${snapshot.data}",
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
    );
  }
}


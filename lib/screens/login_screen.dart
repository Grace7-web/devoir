import 'package:flutter/material.dart';
import '../widgets/custom_button.dart'; // Assurez-vous d'avoir ce fichier

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final Color primaryPink = const Color(0xFFE91E63);
  final Color lightPink = const Color(0xFFFCE4EC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: primaryPink),
          onPressed: () {
            // Revenir à la page précédente (ex: la page d'accueil si l'utilisateur y était)
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo de la marketplace
            CircleAvatar(
              radius: 50,
              backgroundColor: lightPink,
              child: Icon(Icons.shopping_bag_outlined, size: 50, color: primaryPink),
            ),
            const SizedBox(height: 16),
            Text(
              "Bienvenue !",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primaryPink,
              ),
            ),
            const Text(
              "Connectez-vous à votre compte",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),

            // Champ Email
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email_outlined, color: primaryPink),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: primaryPink, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Champ Mot de passe
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mot de passe",
                prefixIcon: Icon(Icons.lock_outline, color: primaryPink),
                suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: primaryPink, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Mot de passe oublié
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // TODO: Naviguer vers la page "Mot de passe oublié"
                },
                child: Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(color: primaryPink.withOpacity(0.8)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bouton Se connecter
            CustomButton(
              text: "Se connecter",
              onPressed: () {
                Navigator.pushNamed(context, '/accueilPage');
                // TODO: Logique de connexion
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Connexion en cours...")),

                );
              },
            ),
            const SizedBox(height: 30),

            // Séparateur "Ou"
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey.shade300)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("OU", style: TextStyle(color: Colors.grey.shade600)),
                ),
                Expanded(child: Divider(color: Colors.grey.shade300)),
              ],
            ),
            const SizedBox(height: 20),

            // Boutons de connexion sociale
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSocialButton(Icons.facebook, Colors.blue),
                _buildSocialButton(Icons.g_mobiledata, Colors.red), // Icône Google
                _buildSocialButton(Icons.apple, Colors.black),
              ],
            ),
            const SizedBox(height: 40),

            // Pas encore de compte ? S'inscrire
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Pas encore de compte ? "),
                GestureDetector(
                  onTap: () {
                    // TODO: Naviguer vers la page d'inscription
                     Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(
                      color: primaryPink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: color,
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }
}
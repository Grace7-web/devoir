import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _acceptTerms = false;
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Créer un compte",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primaryPink,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Rejoignez notre communauté de shopping",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Champ Nom Complet
            _buildTextField("Nom complet", Icons.person_outline),
            const SizedBox(height: 20),

            // Champ Email
            _buildTextField("Email", Icons.email_outlined, keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 20),

            // Champ Mot de passe
            _buildTextField("Mot de passe", Icons.lock_outline, isPassword: true),
            const SizedBox(height: 20),

            // Champ Confirmation Mot de passe
            _buildTextField("Confirmer le mot de passe", Icons.lock_reset, isPassword: true),
            const SizedBox(height: 10),

            // Case à cocher Conditions d'utilisation
            Row(
              children: [
                Checkbox(
                  value: _acceptTerms,
                  activeColor: primaryPink,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    "J'accepte les conditions d'utilisation et la politique de confidentialité.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Bouton S'inscrire
            CustomButton(
              text: "S'inscrire",
              onPressed: _acceptTerms
                  ? () { Navigator.pushNamed(context, '/accueilPage'); }
                  : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Veuillez accepter les conditions")),
                );
              },
            ),
            const SizedBox(height: 20),

            // Déjà un compte ?
            Center(
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: RichText(
                  text: TextSpan(
                    text: "Déjà un compte ? ",
                    style: const TextStyle(color: Colors.black54),
                    children: [
                      TextSpan(
                        text: "Se connecter",
                        style: TextStyle(color: primaryPink, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget d'aide pour construire les champs de texte
  Widget _buildTextField(String label, IconData icon, {bool isPassword = false, TextInputType? keyboardType}) {
    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: primaryPink),
        filled: true,
        fillColor: lightPink.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryPink, width: 1.5),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color, // Si null, utilisera le rose par défaut
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    // Définition de la couleur principale (Rose)
    const Color defaultPink = Color(0xFFE91E63);

    return SizedBox(
      width: double.infinity, // Prend toute la largeur disponible
      height: 55,            // Hauteur standard pour un bouton mobile confortable
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? defaultPink,
          foregroundColor: textColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Bords arrondis style moderne
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
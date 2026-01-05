import 'package:flutter/material.dart';
import 'package:market_place_universel/screens/login_screen.dart';
import 'package:market_place_universel/screens/onboarding_screen.dart';
import 'package:market_place_universel/screens/registrer_screen.dart';
import 'screens/AccueilPage.dart'; // Assurez-vous que le chemin est correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarketPlace Rose',
      debugShowCheckedModeBanner: false,

      // Configuration du thème global en Rose
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE91E63),
          primary: const Color(0xFFE91E63),
        ),
      ),

      // Définition de la route initiale
      initialRoute: '/',

      // Table des routes
      routes: {
        '/accueilPage': (context) => const AccueilPage(),
        // Vous ajouterez vos prochaines pages ici :
        '/login': (context) => const LoginScreen(),
         '/register': (context) => const RegisterScreen(),
        '/':(context) => const OnboardingScreen(),
      },
    );
  }
}
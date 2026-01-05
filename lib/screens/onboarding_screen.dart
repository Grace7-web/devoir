import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _data = [
    {
      "title": "Trouvez vos envies",
      "desc": "Découvrez des milliers de produits tendance sélectionnés pour vous.",
      "icon": Icons.search,
    },
    {
      "title": "Paiement Sécurisé",
      "desc": "Achetez en toute confiance avec nos protocoles de sécurité avancés.",
      "icon": Icons.lock,
    },
    {
      "title": "Livraison Rapide",
      "desc": "Recevez vos articles directement chez vous en un temps record.",
      "icon": Icons.local_shipping,
    },
  ];


  @override
  Widget build(BuildContext context) {
    const Color primaryPink = Color(0xFFE91E63);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) => setState(() => _currentPage = value),
              itemCount: _data.length,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Icon(
              _data[index]["icon"],
                size: 100,
                color: primaryPink,
              )
                ,
                  const SizedBox(height: 40),
                  Text(
                    _data[index]["title"]!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primaryPink,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      _data[index]["desc"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // Indicateurs de pages (points)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _data.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 5),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? primaryPink : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: CustomButton(
                    text: _currentPage == _data.length - 1 ? "Commencer" : "Suivant",
                    onPressed: () {
                      if (_currentPage < _data.length - 1) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        // Aller à la page de connexion
                        Navigator.pushReplacementNamed(context, '/login');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
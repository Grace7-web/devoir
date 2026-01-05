import 'package:flutter/material.dart';

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  // Palette de couleurs
  final Color primaryPink = const Color(0xFFE91E63);
  final Color lightPink = const Color(0xFFFCE4EC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu, color: primaryPink),
        title: Text(
          "MarketPlace",
          style: TextStyle(color: primaryPink, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: primaryPink),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: primaryPink),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher un produit...",
                  prefixIcon: Icon(Icons.search, color: primaryPink),
                  filled: true,
                  fillColor: lightPink.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Bannière promotionnelle
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [primaryPink, Colors.pinkAccent]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Offres d'été",
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("-50% sur la mode",
                            style: TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.local_mall, size: 80, color: Colors.white.withOpacity(0.3)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Section Catégories
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Catégories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                children: [
                  _buildCategoryItem(Icons.checkroom, "Mode"),
                  _buildCategoryItem(Icons.devices, "Électro"),
                  _buildCategoryItem(Icons.home, "Maison"),
                  _buildCategoryItem(Icons.sports_soccer, "Sport"),
                ],
              ),
            ),

            // Grille de Produits
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Produits populaires", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildProductCard("Produit ${index + 1}", "2500 FCFA");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: lightPink,
            child: Icon(icon, color: primaryPink),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildProductCard(String name, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: lightPink,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              ),
              child: Center(child: Icon(Icons.image, color: primaryPink, size: 50)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(price, style: TextStyle(color: primaryPink, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
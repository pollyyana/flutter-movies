import 'package:flutter/material.dart';
    
class FavoritesPage extends StatelessWidget {

  const FavoritesPage({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // nao coloca o item de back
        automaticallyImplyLeading: false,
        title: const Text('Favorites Page'),
      ),
      body: Text('Estou na favorites Page'),
    );
  }
}
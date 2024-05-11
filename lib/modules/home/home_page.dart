import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:flutter/material.dart';

//responsavel por carregas a tela movies e favoritos
  
class HomePage extends StatelessWidget {

  const HomePage({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
        BottomNavigationBarItem(icon: Icon(FilmesAppIcons.heart_empty), label: 'Favorites', backgroundColor: Colors.black),
        BottomNavigationBarItem(icon: Icon(Icons.login_outlined), label: 'Sair', backgroundColor: Colors.black),
      ],),
      body: Container(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:portifolio/screens/apresentation.dart';
import 'package:portifolio/screens/feed.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int index = 0;
  List telas = [
    TelaInicial(),
    TelaFeed(),
  ];
  void mudarIndex(int indexNovo){
    setState(() {
      index = indexNovo;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:telas.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Apresentação"),
        BottomNavigationBarItem(icon: Icon(Icons.feed), label: "Feed"),
      ],
      currentIndex: index,
      onTap: mudarIndex,
      type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
import 'package:aula1/pages/telaVini.dart';
import 'package:aula1/pages/telacolumn.dart';
import 'package:aula1/pages/telamix.dart';
import 'package:aula1/pages/telarow.dart';
import 'package:aula1/pages/telastack.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // Aqui você coda a sua lógica
  int index = 0;
  List telas = [
    Telacolumn(),
    TelaRow(),
    TelaStack(),
    TelaMix(),
    Telavini()
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
        BottomNavigationBarItem(icon: Icon(Icons.view_agenda), label: "Column"),
        BottomNavigationBarItem(icon: Icon(Icons.view_column), label: "Row"),
        BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Stack"),
        BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "Mix"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Tela Vini"),
      ],
      currentIndex: index, // Fala qual é o index atual para abrir a página
      onTap: mudarIndex, // Função para mudar o index
      type: BottomNavigationBarType.fixed, // Tira o aviso de limite de botões
      ),
    );
  }
}
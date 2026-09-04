import 'package:contador_app/styles/geral.dart';
import 'package:flutter/material.dart';

// Quando a tela depende de um valor de outra tela para iniciar
class TelaContador extends StatefulWidget {
  const TelaContador({super.key});

  @override
  State<TelaContador> createState() => _TelaContadorState();
}

// A lógica interna da tela
class _TelaContadorState extends State<TelaContador> {
  // Code a sua lógica interna aqui, como variáveis, funções, etc.
  int numero = 0;
  int indexFrase = 0;
  List frases = [
    "Projeto de Area",
    "Hackathon d+",
    "TCC",
  ];
  void mudarFrase() {
    if (indexFrase < frases.length - 1) {
      setState(() {
        indexFrase++;
      });
    } else {
      setState(() {
        indexFrase = 0;
      });
    }
  }
  // Função para adicionar valor do contador
  void adicionar() {
    setState(() {
      numero++;
    });
  }
  // Função para diminuir o valor do contador
  void diminuir() {
    setState(() {
      numero--;
    });
  }
  // Função para resetar o valor do contador
  void resetar() {
    setState(() {
      numero = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Contador")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 80,
        children: [
        Text("Flutter Contador", style: titulo),
        Text("$numero"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
          TextButton(style: botao, onPressed: adicionar, child: Icon(Icons.add)),
          TextButton(style: botao, onPressed: resetar, child: Icon(Icons.refresh)),
          TextButton(style: botao, onPressed: diminuir, child: Icon(Icons.remove))
        ],),
        Text(frases[indexFrase]),
        TextButton(style: botao, onPressed: mudarFrase, child: Text("Next"))
      ])
    );
  }
}
// ListView faz a rolagem de tela
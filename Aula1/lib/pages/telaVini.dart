import 'package:flutter/material.dart';

class Telavini extends StatelessWidget {
  const Telavini({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Vini", style: TextStyle(fontFamily: "Montserrat"),)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(width: double.infinity, height: 250, color: Colors.grey),
                Image.asset("assets/download.png", width: 200, height: 200)
              ],
            ),
            Row(
              spacing: 30,
              children: [
                Icon(Icons.menu_book),
                Text("Aulas")
              ],),
              Text("Conteudo"),
            Row(
              spacing: 30,
              children: [
                Image.asset("assets/gatinho.png", width: 100, height: 100),
                Text("Introdução a Flutter"),
              ],),
          ],
        ),
    );
  }
}
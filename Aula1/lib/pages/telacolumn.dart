import 'package:aula1/style/geral.dart';
import 'package:flutter/material.dart';

class Telacolumn extends StatelessWidget {
  const Telacolumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Column", style: titulo
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Container(width: tamanho, height: tamanho, color: Colors.lightBlueAccent),
            Container(width: tamanho, height: tamanho, color: Colors.blue),
            Container(width: tamanho, height: tamanho, color: Colors.blueGrey),
            TextButton(
              style: estiloBotao,
              onPressed: () {
                Navigator.pushNamed(context, "/row");
              },
              child: Text("Clique Aqui -> Row"),
            ),
          ],
        ),
      ),
    );
  }
}

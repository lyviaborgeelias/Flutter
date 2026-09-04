import 'package:flutter/material.dart';

class TelaRow extends StatelessWidget {
  const TelaRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Row", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 60, height: 60, color: Colors.lightBlueAccent),
            Container(width: 60, height: 60, color: Colors.blue),
            Container(width: 60, height: 60, color: Colors.blueGrey),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/stack");
              },
              child: Text("Clique Aqui -> Stack"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/mix");
              },
              child: Text("Clique Aqui -> Mix"),
            ),
          ],
        ),
      ),
    );
  }
}

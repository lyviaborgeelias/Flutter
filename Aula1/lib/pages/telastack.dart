import 'package:flutter/material.dart';

class TelaStack extends StatelessWidget {
  const TelaStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Stack", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 100, height: 100, color: Colors.lightBlueAccent),
            Container(width: 60, height: 60, color: Colors.blue),
            Container(width: 20, height: 20, color: Colors.blueGrey),
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

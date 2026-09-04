import 'package:flutter/material.dart';

class TelaMix extends StatelessWidget {
  const TelaMix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Mix", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Text(
              "Olá, eu sou a tela Mix",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Container(width: 60, height: 60, color: Colors.grey),
                Container(width: 60, height: 60, color: Colors.blueGrey),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 100, height: 100, color: Colors.green),
                Container(width: 60, height: 60, color: Colors.lightGreen),
                Container(width: 20, height: 20, color: Colors.lightGreenAccent),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/telavini");
              },
              child: Text("Tela Column", style: TextStyle(color: Colors.black),
            )),
          ],
        ),
      ),
    );
  }
}

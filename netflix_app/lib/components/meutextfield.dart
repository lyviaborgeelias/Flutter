import 'package:flutter/material.dart';

class MeuTextField extends StatelessWidget {
  TextEditingController controlador;
  String tipo;
  MeuTextField({super.key, required this.controlador, required this.tipo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          hintText: "Digite $tipo",
          filled: true, //Ativa o background do TextField
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

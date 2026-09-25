import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  final TextEditingController fofoqueira;
  final String placeholder;
  final TextInputType? tipo;
  final bool senha;
  const InputLogin({super.key, required this.fofoqueira, required this.placeholder, this.tipo = TextInputType.text, this.senha = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
      child: TextField(
        controller: fofoqueira,
        keyboardType: tipo,
        obscureText: senha,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: placeholder,
          prefixIcon: Icon(senha ? Icons.lock_outline : Icons.email_outlined, color: Colors.orange),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.orange, width: 2)),
        ),
      ),
    );
  }
}

//OutlineInputBorder é a borda arredondada
//RoundedRectangleBorder é borda retangular

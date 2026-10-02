import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
class Login extends StatefulWidget {
  const Login({super.key});
 
  @override
  State<Login> createState() => _LoginState();
}
 
class _LoginState extends State<Login> {
  TextEditingController emailDigitado = TextEditingController();
  TextEditingController senhaDigitada = TextEditingController();

  void fazerLogin() async {
    try{
      FirebaseAuth.instance.signInWithEmailAndPassword(email: emailDigitado.text, password: senhaDigitada.text);
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("login realizado com Sucesso")));
      }
    }on FirebaseAuthException catch(e){
      if(e.code == "invalid-email"){
        
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercadinho_app/screens/telalogin.dart';
import 'package:mercadinho_app/components/inputlogin.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  TextEditingController emailDigitado = TextEditingController();
  @override
  void initState(){
    super.initState();
    emailDigitado.text = usuarioEmail;
  }

  void fazerPatch() async{
    final respostaServidor = await http.patch(Uri.parse("https://api-mercadinho-gq9r.onrender.com/usuarios/$usuarioId"),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode({
        "email": emailDigitado.text
      })
    );
    if(respostaServidor.statusCode == 200){
      setState((){
        usuarioEmail = emailDigitado.text;
      });
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Dado alterado com sucesso"),));
      }
    }else{
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Erro ao atualizar dados!"),));
      }
    }
  }

  void finalizarSessao(){
    usuarioId = null;
    usuarioEmail = null;
    //Usamos o pushAndRemoveUntil para apagar todas as rotas anteriores e criar um novo contexto.
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> TelaLogin()), (route)=> false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meu perfil"), automaticallyImplyLeading: false),
      body: SingleChildScrollView(child: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
        const SizedBox(height: 26),
        const CircleAvatar(radius: 52, backgroundColor: Colors.orange, child: Icon(Icons.person, size: 58, color: Colors.white)),
        const SizedBox(height: 14),
        const Text("Seus dados", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        const Text("Mantenha seu email atualizado", style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 24),
        InputLogin(fofoqueira: emailDigitado, placeholder: "Digite o email", tipo: TextInputType.emailAddress),
        const SizedBox(height: 8),
        SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: fazerPatch, icon: const Icon(Icons.save_outlined), label: const Text("Salvar alterações"))),
        const SizedBox(height: 12),
        SizedBox(width: double.infinity, child: OutlinedButton.icon(onPressed: finalizarSessao, icon: const Icon(Icons.logout), label: const Text("Sair da conta"))),
      ])))
    );
  }
}

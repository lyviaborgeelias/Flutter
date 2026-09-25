import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercadinho_app/components/inputlogin.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  TextEditingController emailDigitado = TextEditingController();
  TextEditingController senhaDigitada = TextEditingController();

  void fazerLogin() async {
    final respostaServidor = await http.get(
      Uri.parse("https://api-mercadinho-gq9r.onrender.com/usuarios"),
    );
    if (respostaServidor.statusCode == 200) {
      final dados = jsonDecode(respostaServidor.body);
      var encontrouUsuario = false;
      for (final usuario in dados) {
        if (usuario["email"] == emailDigitado.text &&
            usuario["senha"] == senhaDigitada.text) {
          encontrouUsuario = true;
          usuarioId = usuario["id"];
          usuarioEmail = usuario["email"];
          statusAdmin = usuario["admin"];
          if (mounted) {
            Navigator.pushNamed(context, "/navbar");
          }
        }
      }
      if (!encontrouUsuario && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email ou senha inválidos"),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Usuário ou senha inválidos!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.storefront,
                      size: 58,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    "Bem-vindo ao Mercadinho",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Entre para continuar suas compras",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 22),
                  InputLogin(
                    fofoqueira: emailDigitado,
                    placeholder: "Digite seu email",
                    tipo: TextInputType.emailAddress,
                  ),
                  InputLogin(
                    fofoqueira: senhaDigitada,
                    placeholder: "Digite sua senha",
                    senha: true,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: fazerLogin,
                      icon: const Icon(Icons.login),
                      label: const Text("Entrar"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

dynamic usuarioId;
dynamic usuarioEmail;
bool? statusAdmin;

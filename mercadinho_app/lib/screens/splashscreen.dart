import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //lógica
  @override
  void initState(){
    super.initState();
    Future.delayed( // funcao FUTURA, que espera um determinado tempo e depois realiza uma ação
      Duration(seconds: 4),
      (){if(mounted) Navigator.pushNamed(context, "/login");}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 14,
          children: [
          Container(padding: const EdgeInsets.all(22), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: const Icon(Icons.storefront, size: 92, color: Colors.orange)),
          const Text("Mercadinho", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
          const Text("Tudo fresquinho para você", style: TextStyle(color: Colors.white70, fontSize: 15)),
          const SizedBox(height: 10),
          const CircularProgressIndicator(color: Colors.white)
        ],),
      ),
    );
  }
}

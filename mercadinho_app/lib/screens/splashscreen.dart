import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //lógica
  void initState(){
    super.initState();
    Future.delayed( // funcao FUTURA, que espera um determinado tempo e depois realiza uma ação
      Duration(seconds: 4),
      (){Navigator.pushNamed(context, "/login");}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
           Image.network("https://cdn-icons-png.flaticon.com/512/6680/6680292.png", width:200),
          CircularProgressIndicator(color: Colors.orange,)
        ],),
      ),
    );
  }
}
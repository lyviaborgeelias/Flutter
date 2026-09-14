import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Aqui voce coda a lógica
  @override
  void initState(){
    super.initState();
    Future.delayed( //Funcao FUTURA que espera um determinado tempo e depois realiza uma ação
      Duration(seconds: 5),
      (){Navigator.pushNamed(context, "/home");}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
        Image.network("https://static.vecteezy.com/system/resources/thumbnails/050/834/655/small/supermarket-3d-illustration-png.png", width:200),
        CircularProgressIndicator(color:Colors.orange),
      ],))
    );
  }
}
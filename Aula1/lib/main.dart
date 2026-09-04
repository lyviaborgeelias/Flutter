import 'package:aula1/navigation/navbar.dart';
import 'package:aula1/pages/telaVini.dart';
import 'package:aula1/pages/telacolumn.dart';
import 'package:aula1/pages/telamix.dart';
import 'package:aula1/pages/telarow.dart';
import 'package:aula1/pages/telastack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  //funcao principal
  runApp(const MyApp()); //funcao que roda o app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //fornece os componentes para as telas e faz a configuracao do app
      initialRoute: "/",
      routes: {
        "/": (context) => Navbar(),
        "/column": (context) => Telacolumn(),
        "/row": (context) => TelaRow(),
        "/stack": (context) => TelaStack(),
        "/mix": (context) => TelaMix(),
        "/telavini": (context) => Telavini(),
      },
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
    );
  }
}

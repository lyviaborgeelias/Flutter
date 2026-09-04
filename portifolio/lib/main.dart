import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/navigation/navbar.dart';
import 'package:portifolio/screens/apresentation.dart';
import 'package:portifolio/screens/feed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => Navbar(),
        "/apresentacao": (context) => TelaInicial(),
        "/feed": (context) => TelaFeed(),
      },
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
    );
  }
}
// Estilo do texto
// Estilo de componente usamos "final"
// Estilo de cor usamos "const"

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

final titulo = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: const Color.fromARGB(255, 129, 83, 209),
  fontFamily: GoogleFonts.montserrat().fontFamily
);

final botao = TextButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 129, 83, 209),
  foregroundColor: Colors.white,
  fixedSize: Size(40, 20),
);
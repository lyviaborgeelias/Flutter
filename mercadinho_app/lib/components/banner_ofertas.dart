import 'package:flutter/material.dart';

class BannerOfertas extends StatelessWidget {
  const BannerOfertas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 336,
      padding: const EdgeInsets.fromLTRB(32, 30, 28, 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(colors: [Color(0xFF07583D), Color(0xFF155F3C), Color(0xFF426932)]),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("FEIRA DE HOJE", style: TextStyle(color: Color(0xFFB8D8C7), fontWeight: FontWeight.bold, letterSpacing: 2)),
        const SizedBox(height: 12),
        const Text("Frutas e legumes\ncolhidos de manhã,\nna sua porta à tarde.", style: TextStyle(fontFamily: "serif", color: Colors.white, fontSize: 31, height: 1.12, fontWeight: FontWeight.bold)),
        const Spacer(),
        const Text("Itens frescos, escolhidos com carinho.\nEntrega em até 2h no bairro.", style: TextStyle(color: Colors.white70, height: 1.35)),
        const SizedBox(height: 16),
        ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.arrow_forward, size: 17), label: const Text("Ver ofertas do dia"), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF9BC8B4), foregroundColor: const Color(0xFF164E39), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)), padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14))),
      ]),
    );
  }
}

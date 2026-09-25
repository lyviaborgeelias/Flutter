import 'package:flutter/material.dart';
import 'package:mercadinho_app/screens/telacarrinho.dart';

class MinhaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MinhaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F5EC),
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        final compacto = constraints.maxWidth < 650;
        return Row(children: [
          const CircleAvatar(backgroundColor: Color(0xFF19734F), radius: 18, child: Text("M", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))),
          const SizedBox(width: 10),
          Text(compacto ? "Mercadinho" : "Mercado da Esquina", style: const TextStyle(fontFamily: "serif", fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF292820))),
          const SizedBox(width: 24),
          Expanded(child: Container(height: 42, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: const Color(0xFFE0DDD4))), child: const TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search, color: Colors.grey), hintText: "Buscar tomate, café, pão de queijo...", border: InputBorder.none, contentPadding: EdgeInsets.only(top: 10))))),
          if (!compacto) ...[
            const SizedBox(width: 24),
            TextButton(onPressed: () => Navigator.pushNamed(context, "/perfil"), child: const Text("Entrar", style: TextStyle(color: Color(0xFF68665D)))),
          ],
          const SizedBox(width: 10),
          InkWell(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TelaCarrinho())), borderRadius: BorderRadius.circular(24), child: Container(padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10), decoration: BoxDecoration(color: const Color(0xFF292820), borderRadius: BorderRadius.circular(24)), child: Row(children: [
            const Icon(Icons.shopping_bag_outlined, color: Colors.white, size: 18),
            if (!compacto) const Padding(padding: EdgeInsets.only(left: 7), child: Text("Sacola", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            const SizedBox(width: 8),
            CircleAvatar(radius: 10, backgroundColor: const Color(0xFFF5B331), child: Text("${produtosCarrinho.length}", style: const TextStyle(fontSize: 11, color: Color(0xFF292820), fontWeight: FontWeight.bold))),
          ]))),
          if (!compacto) IconButton(onPressed: () => Navigator.pushNamed(context, "/gestao"), icon: const Icon(Icons.settings_outlined, color: Color(0xFF292820))),
        ]);
      })),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(66);
}

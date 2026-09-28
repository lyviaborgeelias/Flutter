import 'package:flutter/material.dart';
import 'package:mercadinho_app/screens/telacarrinho.dart';

class ResumoSacola extends StatelessWidget {
  const ResumoSacola({super.key});

  @override
  Widget build(BuildContext context) {
    final total = produtosCarrinho.fold<double>(0, (soma, produto) => soma + produto.preco * (quantidadesCarrinho[produto] ?? 1));
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFFCFBF7), borderRadius: BorderRadius.circular(26), border: Border.all(color: const Color(0xFFE0DDD4))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text("Sua sacola", style: TextStyle(fontFamily: "serif", fontSize: 20, fontWeight: FontWeight.bold)),
          CircleAvatar(radius: 12, backgroundColor: const Color(0xFF9BC8B4), child: Text("${quantidadeTotalCarrinho()}", style: const TextStyle(fontSize: 11, color: Color(0xFF164E39)))),
        ]),
        const SizedBox(height: 18),
        const Text("Entre na sua conta", style: TextStyle(color: Color(0xFF19734F), fontWeight: FontWeight.bold)),
        const Text(" para montar sua sacola", style: TextStyle(color: Colors.grey)),
        const Divider(height: 24),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Subtotal", style: TextStyle(color: Colors.grey)), Text("R\$ ${total.toStringAsFixed(2)}", style: const TextStyle(color: Colors.grey))]),
        const SizedBox(height: 9),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Entrega", style: TextStyle(color: Colors.grey)), Text("Grátis", style: TextStyle(color: Color(0xFF19734F), fontWeight: FontWeight.bold))]),
        const SizedBox(height: 18),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Total", style: TextStyle(fontWeight: FontWeight.bold)), Text("R\$ ${total.toStringAsFixed(2)}", style: const TextStyle(fontFamily: "serif", fontSize: 23, color: Color(0xFF07583D), fontWeight: FontWeight.bold))]),
        const SizedBox(height: 14),
        SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TelaCarrinho())), icon: const Icon(Icons.arrow_forward, size: 17), label: const Text("Finalizar compra"), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF91BDAA), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)), elevation: 0))),
      ]),
    );
  }
}

class ResumoSacolaAtualizado extends StatelessWidget {
  const ResumoSacolaAtualizado({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<int>(valueListenable: carrinhoAtualizado, builder: (context, _, __) => const ResumoSacola());
}

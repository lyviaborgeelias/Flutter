import 'package:flutter/material.dart';
import 'package:mercadinho_app/screens/telacarrinho.dart';

class ProdutosCard extends StatelessWidget {
  final String nome;
  final double preco;
  final String urlImagem;
  
  const ProdutosCard({super.key, required this.nome, required this.preco, required this.urlImagem });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Center(child: Image.network(urlImagem, fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported, size: 58, color: Colors.grey)))),
          const SizedBox(height: 6),
          Text(nome, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("R\$ ${preco.toStringAsFixed(2)}", style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
            IconButton(onPressed: () {
              if (!produtosCarrinho.any((produto) => produto.nome == nome)) produtosCarrinho.add(this);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Produto adicionado ao carrinho"), duration: Duration(seconds: 1)));
            }, icon: const Icon(Icons.add_shopping_cart, color: Colors.orange), padding: EdgeInsets.zero, constraints: const BoxConstraints()),
          ])
        ]),
      ),
    );
  }
}

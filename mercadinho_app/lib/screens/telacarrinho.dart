import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mercadinho_app/screens/telalogin.dart';
import 'package:mercadinho_app/components/produtos.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({super.key});

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  final Map<ProdutosCard, int> quantidades = {};

  int quantidadeDoProduto(ProdutosCard produto) => quantidades[produto] ?? 1;

  void aumentar(ProdutosCard produto) {
    setState(() => quantidades[produto] = quantidadeDoProduto(produto) + 1);
  }

  void diminuir(ProdutosCard produto) {
    final quantidadeAtual = quantidadeDoProduto(produto);
    if (quantidadeAtual == 1) return;
    setState(() => quantidades[produto] = quantidadeAtual - 1);
  }

  double somarTotal() {
    return produtosCarrinho.fold<double>(
      0,
      (total, produto) => total + produto.preco * quantidadeDoProduto(produto),
    );
  }

  void fazerPost() async {
    dynamic itensPedido = produtosCarrinho.map((produto) {
      return {
        "Nome do produto": produto.nome,
        "quantidade": quantidadeDoProduto(produto),
      };
    });

    final respostaServidor = await http.post(
      Uri.parse("https://api-mercadinho-gq9r.onrender.com/pedidos"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "usuarioId": usuarioId,
        "total": somarTotal(),
        "itens": itensPedido,
      }),
    );

    if (respostaServidor.statusCode == 201) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Dado criado com sucesso")));
        setState(() {
          produtosCarrinho.clear();
          quantidades.clear();
        });
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Erro ao criar pedido")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = somarTotal();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu carrinho"),
        automaticallyImplyLeading: false,
      ),
      body: produtosCarrinho.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 76,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 14),
                  Text(
                    "Seu carrinho está vazio",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Adicione produtos na tela inicial"),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: produtosCarrinho.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final produto = produtosCarrinho[index];
                      final quantidade = quantidadeDoProduto(produto);
                      return Card(
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  produto.urlImagem,
                                  width: 72,
                                  height: 72,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => const Icon(
                                    Icons.image_not_supported,
                                    size: 52,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      produto.nome,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "R\$ ${produto.preco.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () => diminuir(produto),
                                          icon: const Icon(
                                            Icons.remove_circle_outline,
                                          ),
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: Text(
                                            "$quantidade",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => aumentar(produto),
                                          icon: const Icon(
                                            Icons.add_circle_outline,
                                          ),
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () => setState(() {
                                  produtosCarrinho.removeAt(index);
                                  quantidades.remove(produto);
                                }),
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 22),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 8),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total da compra",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "R\$ ${total.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: fazerPost,
                          icon: const Icon(Icons.check),
                          label: const Text("Finalizar pedido"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

List<ProdutosCard> produtosCarrinho = [];

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercadinho_app/components/minha_app_bar.dart';
import 'package:mercadinho_app/components/produtos.dart';
import 'package:mercadinho_app/screens/telacarrinho.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  //lógica
  List produtos = [];
  final List<Map<String, dynamic>> produtosParaCadastrar = [
    {
      "nome": "Arroz 5 kg",
      "preco": 24.90,
      "imagem":
          "https://images.unsplash.com/photo-1586201375761-83865001e31c?w=500",
    },
    {
      "nome": "Feijão carioca 1 kg",
      "preco": 8.49,
      "imagem":
          "https://images.unsplash.com/photo-1551462147-ff29053bfc14?w=500",
    },
    {
      "nome": "Café torrado 500 g",
      "preco": 16.90,
      "imagem":
          "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500",
    },
    {
      "nome": "Leite integral 1 L",
      "preco": 5.79,
      "imagem":
          "https://images.unsplash.com/photo-1550583724-b2692b85b150?w=500",
    },
    {
      "nome": "Pão de forma",
      "preco": 9.99,
      "imagem":
          "https://images.unsplash.com/photo-1509440159596-0249088772ff?w=500",
    },
    {
      "nome": "Banana prata",
      "preco": 6.49,
      "imagem":
          "https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=500",
    },
    {
      "nome": "Maçã nacional",
      "preco": 8.99,
      "imagem":
          "https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=500",
    },
    {
      "nome": "Suco de laranja 1 L",
      "preco": 7.49,
      "imagem":
          "https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=500",
    },
  ];

  @override
  void initState() {
    super.initState();
    fazerGet();
  }

  void fazerGet() async {
    //final é o tipo de variável que começa nulo e depois recebe um valor, ideal para comunicação com API
    final respostaServidor = await http.get(
      Uri.parse("https://api-mercadinho-gq9r.onrender.com/produtos"),
    );
    if (respostaServidor.statusCode == 200) {
      final dados = List<dynamic>.from(jsonDecode(respostaServidor.body));
      var cadastrouProduto = false;
      for (final produtoNovo in produtosParaCadastrar) {
        final produtoExiste = dados.any((produto) => produto["nome"] == produtoNovo["nome"]);
        if (!produtoExiste) {
          final respostaPost = await http.post(
            Uri.parse("https://api-mercadinho-gq9r.onrender.com/produtos"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(produtoNovo),
          );
          if (respostaPost.statusCode == 201) cadastrouProduto = true;
        }
      }
      if (cadastrouProduto) {
        final respostaAtualizada = await http.get(Uri.parse("https://api-mercadinho-gq9r.onrender.com/produtos"));
        if (respostaAtualizada.statusCode == 200) {
          dados
            ..clear()
            ..addAll(List<dynamic>.from(jsonDecode(respostaAtualizada.body)));
        }
      }
      setState(() {
        produtos = dados;
      });
    } else {
      if (mounted) {
        //Mounted verifica se a página foi montada antes de aparecer uma mensagem de falha
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Falha ao carregar produtos da API!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MinhaAppBar(),
      body: produtos.isEmpty ? const Center(child: CircularProgressIndicator(color: Color(0xFF19734F))) : LayoutBuilder(builder: (context, constraints) {
        final colunas = constraints.maxWidth > 1100 ? 4 : constraints.maxWidth > 720 ? 3 : 2;
        final larguraCard = (constraints.maxWidth - 52 - ((colunas - 1) * 14)) / colunas;
        return SingleChildScrollView(child: Padding(padding: const EdgeInsets.fromLTRB(26, 24, 26, 40), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: Container(height: 336, padding: const EdgeInsets.fromLTRB(32, 30, 28, 28), decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), gradient: const LinearGradient(colors: [Color(0xFF07583D), Color(0xFF155F3C), Color(0xFF426932)])), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("FEIRA DE HOJE", style: TextStyle(color: Color(0xFFF5B331), fontWeight: FontWeight.bold, letterSpacing: 2)),
              const SizedBox(height: 12),
              const Text("Frutas e legumes\ncolhidos de manhã,\nna sua porta à tarde.", style: TextStyle(fontFamily: "serif", color: Colors.white, fontSize: 31, height: 1.12, fontWeight: FontWeight.bold)),
              const Spacer(),
              const Text("Itens frescos, escolhidos com carinho.\nEntrega em até 2h no bairro.", style: TextStyle(color: Colors.white70, height: 1.35)),
              const SizedBox(height: 16),
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.arrow_forward, size: 17), label: const Text("Ver ofertas do dia"), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF5B331), foregroundColor: const Color(0xFF292820), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)), padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14))),
            ]))),
            if (constraints.maxWidth > 850) const SizedBox(width: 22),
            if (constraints.maxWidth > 850) const SizedBox(width: 330, child: _ResumoSacola()),
          ]),
          if (constraints.maxWidth <= 850) const Padding(padding: EdgeInsets.only(top: 18), child: _ResumoSacola()),
          const SizedBox(height: 28),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text("Categorias", style: TextStyle(fontFamily: "serif", fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF292820))), Text("Ver todas", style: TextStyle(color: Color(0xFF19734F), fontWeight: FontWeight.bold))]),
          const SizedBox(height: 12),
          Wrap(spacing: 10, runSpacing: 10, children: ["Hortifruti", "Padaria", "Carnes", "Laticínios", "Bebidas", "Limpeza"].map((categoria) => Chip(label: Text(categoria), backgroundColor: const Color(0xFFFAF9F5), side: const BorderSide(color: Color(0xFFE0DDD4)), padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8))).toList()),
          const SizedBox(height: 32),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Em destaque", style: TextStyle(fontFamily: "serif", fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF292820))), Text("${produtos.length} itens", style: const TextStyle(color: Color(0xFF77746A)))]),
          const SizedBox(height: 14),
          Wrap(spacing: 14, runSpacing: 14, children: [for(final produto in produtos) SizedBox(width: larguraCard, height: 270, child: ProdutosCard(nome: produto["nome"], preco: (produto["preco"] as num).toDouble(), urlImagem: produto["imagem"]))]),
        ])));
      }),
    );
  }
}

class _ResumoSacola extends StatelessWidget {
  const _ResumoSacola();

  @override
  Widget build(BuildContext context) {
    final total = produtosCarrinho.fold<double>(0, (soma, produto) => soma + produto.preco);
    return Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFFFCFBF7), borderRadius: BorderRadius.circular(26), border: Border.all(color: const Color(0xFFE0DDD4))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Sua sacola", style: TextStyle(fontFamily: "serif", fontSize: 20, fontWeight: FontWeight.bold)), CircleAvatar(radius: 12, backgroundColor: Color(0xFFF5B331), child: Text("${produtosCarrinho.length}", style: TextStyle(fontSize: 11)))]),
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
    ]));
  }
}

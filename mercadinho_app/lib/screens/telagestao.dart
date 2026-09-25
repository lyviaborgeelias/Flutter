import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaGestao extends StatefulWidget {
  const TelaGestao({super.key});

  @override
  State<TelaGestao> createState() => _TelaGestaoState();
}

class _TelaGestaoState extends State<TelaGestao> {
  TextEditingController nomeDigitado = TextEditingController();
  TextEditingController urlDigitado = TextEditingController();
  TextEditingController precoDigitado = TextEditingController();
  List listaProdutos = [];

  @override
  void initState() {
    super.initState();
    fazerGet();
  }

  void fazerPost() async {
    final preco = double.tryParse(precoDigitado.text.replaceAll(',', '.'));
    if (nomeDigitado.text.trim().isEmpty || urlDigitado.text.trim().isEmpty || preco == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Preencha nome, imagem e um preço válido"), backgroundColor: Colors.redAccent));
      return;
    }
    final respostaServidor = await http.post(Uri.parse("https://api-mercadinho-gq9r.onrender.com/produtos"), 
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "nome": nomeDigitado.text,
      "imagem": urlDigitado.text,
      "preco": preco,
    })
    );  

    if(mounted){
      if(respostaServidor.statusCode == 201){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Produto criado com sucesso!"))
          );
          nomeDigitado.clear();
          urlDigitado.clear();
          precoDigitado.clear();
          fazerGet();
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao criar produto, tente novamente!", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,)
          );
      }
    }
  }

  void fazerGet() async{
    final respostaServidor = await http.get(Uri.parse("https://api-mercadinho-gq9r.onrender.com/produtos"));
    if(respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        listaProdutos = dados;
      });
    }else {
      if(mounted){ //Mounted verifica se a logica/tela foi totalmente montada antes de aparecer a mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao carregar dados!"))
        );
      }
    }
  }
  
  void fazerDelete(dynamic id) async {
    final respostaServidor = await http.delete(Uri.parse("https://api-mercadinho-gq9r.onrender.com/produtos/$id"));
    if(respostaServidor.statusCode == 200){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Dado deletado com sucesso")));
        fazerGet();
        Navigator.pushNamed(context, "/navbar");
      }
    }else{
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Falha ao deletado dado!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gestão de produtos")),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text("Novo produto", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
          TextField(controller: nomeDigitado, decoration: const InputDecoration(labelText: "Nome do produto", prefixIcon: Icon(Icons.shopping_bag_outlined))),
          const SizedBox(height: 10),
          TextField(controller: urlDigitado, decoration: const InputDecoration(labelText: "URL da imagem", prefixIcon: Icon(Icons.image_outlined))),
          const SizedBox(height: 10),
          TextField(controller: precoDigitado, keyboardType: const TextInputType.numberWithOptions(decimal: true), decoration: const InputDecoration(labelText: "Preço", prefixIcon: Icon(Icons.attach_money))),
          const SizedBox(height: 14),
          SizedBox(width: double.infinity, child: ElevatedButton.icon(onPressed: fazerPost, icon: const Icon(Icons.add), label: const Text("Cadastrar produto"))),
          const SizedBox(height: 28),
          const Text("Produtos cadastrados", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Divider(indent: 15, endIndent: 15),
          for(final produto in listaProdutos)
          Card(child: ListTile(
            leading: const CircleAvatar(backgroundColor: Color(0xFFFFE0B2), child: Icon(Icons.shopping_bag, color: Colors.orange)),
            title: Text(produto["nome"], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("R\$ ${(produto["preco"] as num).toDouble().toStringAsFixed(2)}"),
            trailing: IconButton(onPressed: ()=> fazerDelete(produto["id"]), icon: Icon(Icons.delete)),
          ))
        ],
      ),
    );
  }
}

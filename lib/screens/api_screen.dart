//tela de requisição para API
import 'dart:convert'; //decodificar a resposta para JSON da API
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //definir um apelido para referência
import 'package:flutteraula02/components/cats.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List<Cat> _cats = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCats();
  }
  //requisição para a API

  Future<void> _fetchCats() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(Uri.parse('https://api.thecatapi.com/v1/breeds'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      setState(() {
        _cats = jsonList.map((json) => Cat.fromJson(json)).toList();
        _isLoading = false;
      });
    } else {
      //se a requisição falhar, exiba um erro
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar os dados')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats API'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _cats.length,
        itemBuilder: (context, index) {
          final cat = _cats[index];
          return ListTile(
            leading: cat.imageUrl != null
                ? Image.network(cat.imageUrl!)
                : const Icon(Icons.pets), //vai exibir um ícone se não houver imagem
            title: Text(cat.name),
            subtitle: Text(cat.description),
          );
        },
      ),
    );
  }
}

//-------------------------------------------------------------------
//CONSIDERAÇÕES
//API Key: A Cats API exige uma chave de API para algumas funcionalidades.
//tratamento de erros: o código acima inclui um tratamento básico de erros,
// exibindo um SnackBar se a requisição falhar.
// adicionar um tratamento de erros mais robusto, como exibir mensagens de erro mais específicas ou tentar novamente a requisição.
//Imagens: para exibir as imagens dos gatos, você pode usar o atributo imageUrl do modelo Cat e um widget como Image.network.
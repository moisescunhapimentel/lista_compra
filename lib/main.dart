import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escolha seus produtos',
      home: ListaProdutos(),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
      ),
    );
  }
}

class ListaProdutosState extends State<ListaProdutos> {

  final _produtos = <String>[
    "Miojo",
    "Cremi Craqui",
    "Arroz",
    "Feijão",
    "Macarrão",
    "Detergente",
    "Algodão",
    "Carne",
    "Ketchup",
    "Pão",
    "Frango",
    "Cuzcuz",
    "Ovo",
    "Manteiga",
    "Vassoura"
  ];

  final Set<String> _saved = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha seus produtos'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/

          if (index >= _produtos.length) {
            return null;
          }
          return _buildRow(_produtos[index]);
        });
  }

  Widget _buildRow(String palavra) {
    final bool alreadySaved = _saved.contains(palavra);
    return ListTile(
        title: Text(palavra, style: _biggerFont),
        trailing: Icon(
          alreadySaved ? Icons.check_box : Icons.check_box_outline_blank,
          color: alreadySaved ? Colors.green : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(palavra);
            } else {
              _saved.add(palavra);
            }
          });
        });
  }
}

class ListaProdutos extends StatefulWidget {
  @override
  ListaProdutosState createState() => ListaProdutosState();
}
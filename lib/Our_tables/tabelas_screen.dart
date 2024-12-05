import 'package:agem/Colors_and_Fonts/colorsFont.dart';
import 'package:flutter/material.dart';
import 'package:agem/Screens/cadastro_produto.dart'; // Import da tela CadastroProdutoScreen

class TabelasScreen extends StatefulWidget {
  const TabelasScreen({super.key});

  @override
  _TabelasScreenState createState() => _TabelasScreenState();
}

class _TabelasScreenState extends State<TabelasScreen> {
  List<Map<String, String>> _tables = [
    {'title': 'Eucalipto', 'creator': 'Administrator'},
    {'title': 'Carvalho', 'creator': 'Administrator'},
    {'title': 'Cerejeira', 'creator': 'Administrator'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: AppColors.backgroundBeige,
        child: ListView.separated(
          itemCount: _tables.length,
          itemBuilder: (context, index) {
            final table = _tables[index];
            return Dismissible(
              key: Key(table['title']!),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                setState(() {
                  _tables.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${table['title']} foi removido')),
                );
              },
              child: itemDetails(table['title']!, table['creator']!),
            );
          },
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: AppColors.brownLight,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navegar para CadastroProdutoScreen e aguardar o resultado
          final especie = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastroProdutoScreen()),
          );

          // Verificar se uma espécie foi retornada
          if (especie != null && especie is String) {
            setState(() {
              _tables.add({'title': especie, 'creator': 'Administrator'});
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tabela "$especie" adicionada')),
            );
          }
        },
        backgroundColor: AppColors.greenMain,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget itemDetails(String title, String creator) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                'Criada por ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Text(
                creator,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greenMain,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

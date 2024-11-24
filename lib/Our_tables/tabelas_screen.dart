import 'package:agem/Colors_and_Fonts/colorsFont.dart';
import 'package:flutter/material.dart';

class TabelasScreen extends StatefulWidget {
  const TabelasScreen({super.key});

  @override
  _TabelasScreenState createState() => _TabelasScreenState();
}

class _TabelasScreenState extends State<TabelasScreen> {
  List<Map<String, String>> _tables = [
    {'title': 'Eucalipto', 'creator': 'Machado de Assis'},
    {'title': 'Carvalho', 'creator': 'Machado de Assis'},
    {'title': 'Pitu', 'creator': 'Machado de Assis'},
    {'title': 'Cerejeira', 'creator': 'Machado de Assis'},
    {'title': 'Bambu', 'creator': 'Machado de Assis'},
    {'title': 'Tabela Preços', 'creator': 'Machado de Assis'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabelas'),
        backgroundColor: AppColors.greenMain,
      ),
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
        onPressed: _showAddTableDialog,
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
                'criada por ',
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

  void _showAddTableDialog() {
    String newTableTitle = '';
    String newTableCreator = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Tabela'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => newTableTitle = value,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                onChanged: (value) => newTableCreator = value,
                decoration: const InputDecoration(labelText: 'Criador'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (newTableTitle.isNotEmpty && newTableCreator.isNotEmpty) {
                  setState(() {
                    _tables.add({'title': newTableTitle, 'creator': newTableCreator});
                  });
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preencha todos os campos!')),
                  );
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}
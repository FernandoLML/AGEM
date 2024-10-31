import 'package:agem/core/colorFont.dart';
import 'package:flutter/material.dart';
import 'fornecedores.dart';
import 'tabelas_screen.dart';

enum SampleItem { itemOne, itemTwo }

class AllTablesScreen extends StatefulWidget {
  const AllTablesScreen({super.key});

  @override
  _AllTablesScreenState createState() => _AllTablesScreenState();
}

class _AllTablesScreenState extends State<AllTablesScreen> {
  String _selectedTab = 'TODOS';
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBeige,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu,
                    size: 36,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Info',
                    style: TextStyle(
                      fontSize: 42,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.search,
                    size: 36,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 16),
                  PopupMenuButton<SampleItem>(
                    onSelected: (SampleItem item) {
                      setState(() {
                        selectedItem = item;
                      });
                      // Implement actions for each selected item
                      if (item == SampleItem.itemOne) {
                        // Action for "Criar Tabela"
                      } else if (item == SampleItem.itemTwo) {
                        // Action for "Criar Fornecedor"
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<SampleItem>>[
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemOne,
                        child: Text('Criar Tabela'),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemTwo,
                        child: Text('Criar Fornecedor'),
                      ),
                    ],
                    icon: const Icon(
                      Icons.more_vert,
                      size: 36,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabItem(context, 'TODOS'),
                _buildTabItem(context, 'TABELAS'),
                _buildTabItem(context, 'FORNECEDORES'),
              ],
            ),
            const SizedBox(height: 24),
            fullWidthDivider(),
            section('Análises', Icons.tag),
            fullWidthDivider(),
            itemDetails('Qtde Madeiras', 'SISTEMA'),
            fullWidthDivider(),
            itemDetails('Tabela Preços', 'SISTEMA'),
            fullWidthDivider(),
            section('Tabelas Criadas', Icons.tag),
            fullWidthDivider(),
            itemDetails('Eucalipto', 'Machado de Assis'),
            fullWidthDivider(),
            itemDetails('Carvalho', 'Machado de Assis'),
            fullWidthDivider(),
            itemDetails('Pitu', 'Machado de Assis'),
            fullWidthDivider(),
            itemDetails('Cerejeira', 'Machado de Assis'),
            fullWidthDivider(),
            itemDetails('Bambu', 'Machado de Assis'),
            fullWidthDivider(),
            itemDetails('Tabela Preços', 'Machado de Assis'),
            fullWidthDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(BuildContext context, String tabName) {
    final bool isSelected = _selectedTab == tabName;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = tabName;
          });
          if (tabName == 'TABELAS') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TabelasScreen(),
              ),
            );
          } else if (tabName == 'FORNECEDORES') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FornecedoresScreen(),
              ),
            );
          }
        },
        child: Center(
          child: Text(
            tabName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.greenMain : AppColors.brownIcon,
              decoration:
                  isSelected ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget fullWidthDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: AppColors.brownLight,
    );
  }

  Widget section(String title, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      color: AppColors.backgroundBeige,
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.brownIcon,
            size: 32,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemDetails(String title, String creator) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      color: AppColors.backgroundBeige,
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
}

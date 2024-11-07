import 'package:agem/Colors_and_Fonts/colorsFont.dart';
import 'package:agem/Dashboard/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:agem/Our_tables/all_tables.dart';
import 'package:agem/Our_tables/fornecedores.dart';

enum SampleItem { itemOne, itemTwo }

class TabelasScreen extends StatefulWidget {
  const TabelasScreen({super.key});

  @override
  _TabelasScreen createState() => _TabelasScreen();
}

class _TabelasScreen extends State<TabelasScreen> {
  String _selectedTab = 'TABELAS';
  SampleItem? selectedItem;
  int _selectedIndex = 1; // Índice do item ativo na BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBeige,
      appBar: AppBar(
        backgroundColor: AppColors.greenMain,
        elevation: 0,
        title: Text(
          'Painéis',
          style: AppTextStyles.body1.copyWith(color: AppColors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColors.white),
          onPressed: () {}, // Ação para o botão de menu
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.white),
            onPressed: () {}, // Ação para o botão de pesquisa
          ),
          PopupMenuButton<SampleItem>(
            onSelected: (SampleItem item) {
              setState(() {
                selectedItem = item;
              });
              // Implementar ações para cada item selecionado
              if (item == SampleItem.itemOne) {
                // Ação para "Criar Tabela"
              } else if (item == SampleItem.itemTwo) {
                // Ação para "Criar Fornecedor"
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemOne,
                child: Text('Criar Tabela'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemTwo,
                child: Text('Criar Fornecedor'),
              ),
            ],
            icon: Icon(Icons.more_vert, color: AppColors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTabItem(context, 'TODOS'),
                  _buildTabItem(context, 'TABELAS'),
                  _buildTabItem(context, 'FORNECEDORES'),
                ],
              ),
            ),
            const SizedBox(height: 24),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.greenMain,
        unselectedItemColor: AppColors.brownLight,
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            ); // Navega para a Dashboard
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Produto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Usuários',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
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
          if (tabName == 'FORNECEDORES') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FornecedoresScreen(),
              ),
            );
          } else if (tabName == 'TODOS') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AllTablesScreen(),
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

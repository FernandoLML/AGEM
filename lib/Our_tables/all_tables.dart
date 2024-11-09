import 'package:agem/Colors_and_Fonts/colorsFont.dart';
import 'package:flutter/material.dart';
import 'package:agem/Our_tables/fornecedores.dart';
import 'package:agem/Our_tables/tabelas_screen.dart';
import 'package:agem/Dashboard/Dashboard.dart';
import 'package:agem/Screens/perfil.dart';
import 'package:agem/Screens/cadastro_produto.dart';

enum SampleItem { itemOne, itemTwo }

class AllTablesScreen extends StatefulWidget {
  const AllTablesScreen({super.key});

  @override
  _AllTablesScreenState createState() => _AllTablesScreenState();
}

class _AllTablesScreenState extends State<AllTablesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  SampleItem? selectedItem;
  int _selectedIndex = 1; // Índice do item ativo na BottomNavigationBar

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBeige,
      appBar: AppBar(
        backgroundColor: AppColors.greenMain,
        elevation: 0,
        title: Text(
          'Produtos',
          style: AppTextStyles.body1.copyWith(color: AppColors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PerfilScreen()), // Navega para a tela de perfil
              );
            },
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              child: const Text('A'),
            ),
          ),
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

              if (item == SampleItem.itemOne) {
                Navigator.pushNamed(context, '/cadastro_produto');
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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.white,
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.brownLight,
          tabs: const [
            Tab(text: 'TODOS'),
            Tab(text: 'PRODUTOS'),
            Tab(text: 'FORNECEDORES'),
          ],
        ),
      ),
      body: Container(
        color: AppColors.backgroundBeige,
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildAllTablesContent(),
            TabelasScreen(), // Tela de Tabelas
            FornecedoresScreen(), // Tela de Fornecedores
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.greenMain,
        unselectedItemColor: AppColors.brownLight,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Atualiza o índice antes da navegação
          });

          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AllTablesScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DashboardScreen(initialTabIndex: 2)),
            );
          } else if (index == 3 && _selectedIndex != 3) {
            // Evita navegação duplicada
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PerfilScreen()),
            );
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

  Widget _buildAllTablesContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

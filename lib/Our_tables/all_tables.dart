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
  int _selectedIndex = 1;

  // Lista de itens que será manipulada
  List<Map<String, String>> _items = [
    {"title": "Análises", "creator": "SISTEMA"},
    {"title": "Qtde Madeiras", "creator": "SISTEMA"},
    {"title": "Tabela Preços", "creator": "SISTEMA"},
    {"title": "Eucalipto", "creator": "Machado de Assis"},
    {"title": "Carvalho", "creator": "Machado de Assis"},
    {"title": "Pitu", "creator": "Machado de Assis"},
    {"title": "Cerejeira", "creator": "Machado de Assis"},
    {"title": "Bambu", "creator": "Machado de Assis"},
  ];

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

  // Função para fixar um item no topo da lista
  void _fixItem(int index) {
    setState(() {
      final item = _items.removeAt(index);
      _items.insert(0, item);
    });
  }

  // Função para excluir um item da lista
  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
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
                MaterialPageRoute(builder: (context) => PerfilScreen()),
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
            onPressed: () {},
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
            TabelasScreen(),
            FornecedoresScreen(),
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
            _selectedIndex = index;
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

  // Alteração para exibir a lista com Dismissible
  Widget _buildAllTablesContent() {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        return Dismissible(
          key: Key(item['title']! + index.toString()),
          background: Container(
            color: Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            child: const Icon(Icons.push_pin, color: Colors.white),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              _deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Item "${item['title']}" excluído')),
              );
            }
          },
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              _fixItem(index);
              return false;
            }
            return true;
          },
          child: ListTile(
            title: Text(item['title']!),
            subtitle: Text('Criado por ${item['creator']}'),
          ),
        );
      },
    );
  }
}

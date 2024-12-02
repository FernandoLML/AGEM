import 'package:agem/Colors_and_Fonts/colorsFont.dart';
import 'package:flutter/material.dart';
import 'package:agem/Our_tables/fornecedores.dart';
import 'package:agem/Our_tables/tabelas_screen.dart';
import 'package:agem/Dashboard/Dashboard.dart';
import 'package:agem/Screens/perfil.dart';
import 'package:agem/Screens/cadastro_produto.dart';

enum SampleItem { itemOne, itemTwo }

class AllTablesScreen extends StatefulWidget {
  const AllTablesScreen({Key? key}) : super(key: key);

  @override
  _AllTablesScreenState createState() => _AllTablesScreenState();
}

class _AllTablesScreenState extends State<AllTablesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1;

  // Lista manipulável
  final List<Map<String, String>> _items = [
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

  // Fixar item no topo da lista
  void _fixItem(int index) {
    setState(() {
      final item = _items.removeAt(index);
      _items.insert(0, item);
    });
  }

  // Excluir item da lista
  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  // Reordenar itens ao arrastar
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }

  // Navegar entre telas do BottomNavigationBar
  void _navigateToScreen(int index) {
    if (index == _selectedIndex) return;

    Widget screen;
    switch (index) {
      case 0:
        screen = DashboardScreen();
        break;
      case 1:
        screen = AllTablesScreen();
        break;
      case 2:
        screen = DashboardScreen(initialTabIndex: 2);
        break;
      case 3:
        screen = PerfilScreen();
        break;
      default:
        return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBeige,
      appBar: _buildAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildReorderableListView(), // Lista arrastável
          const TabelasScreen(),
          FornecedoresScreen(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
              MaterialPageRoute(builder: (context) => const PerfilScreen()),
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
          icon: const Icon(Icons.search, color: AppColors.white),
          onPressed: () {},
        ),
        PopupMenuButton<SampleItem>(
          onSelected: (item) {
            if (item == SampleItem.itemOne) {
              Navigator.pushNamed(context, '/cadastro_produto');
            } else if (item == SampleItem.itemTwo) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FornecedoresScreen()),
              );
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: SampleItem.itemOne, child: Text('Criar Tabela')),
            PopupMenuItem(value: SampleItem.itemTwo, child: Text('Criar Fornecedor')),
          ],
          icon: const Icon(Icons.more_vert, color: AppColors.white),
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
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.greenMain,
      unselectedItemColor: AppColors.brownLight,
      currentIndex: _selectedIndex,
      onTap: _navigateToScreen,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Produto'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Usuários'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }

  Widget _buildReorderableListView() {
  return ReorderableListView.builder(
    onReorder: _onReorder,
    itemCount: _items.length,
    itemBuilder: (context, index) {
      final item = _items[index];
      return Column(
        key: Key(item['title']!),
        children: [
          Dismissible(
            key: Key(item['title']! + index.toString()),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.push_pin, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                _fixItem(index);
                return false; // Não remove o item após fixar
              }
              return true; // Permite remoção
            },
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                _deleteItem(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Item "${item['title']}" excluído')),
                );
              }
            },
            child: ListTile(
              title: Text(item['title']!),
              subtitle: Text('Criado por ${item['creator']}'),
              trailing: const Icon(Icons.drag_handle),
            ),
          ),
          // Adiciona o separador abaixo de cada item
             Divider(
              height: 1,
              thickness: 1,
              color: AppColors.brownLight,
              indent: 16,
              endIndent: 16,
            ),
         ],
        );
     },
    );
  } 
}
import 'package:flutter/material.dart';
import 'package:agem/Our_tables/all_tables.dart';
import 'package:agem/Dashboard/usuarios.dart';
import 'package:agem/Dashboard/Transacoes.dart';
import 'package:agem/main.dart';

class PerfilScreen extends StatefulWidget {
  final int initialTabIndex;

  const PerfilScreen({Key? key, this.initialTabIndex = 0}) : super(key: key);

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTabIndex;
    _tabController =
        TabController(length: 3, vsync: this, initialIndex: _selectedIndex);
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
          IconButton(
            icon: Icon(Icons.more_vert, color: AppColors.white),
            onPressed: () {}, // Ação para o botão de mais opções
          ),
        ],
      ),
      body: Container(
        color: AppColors.backgroundBeige,
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildDashboardContent(),
            TransacoesScreen(), // Abre a tela de Transações
            UserScreen(), // Abre a tela de Usuários
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
              MaterialPageRoute(builder: (context) => PerfilScreen()),
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
                  builder: (context) => PerfilScreen(initialTabIndex: 2)),
            );
          } else if (index == 3) {
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

  Widget _buildDashboardContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card com Avatar, Nome e Email
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height: 155, // Altura fixa do card
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.brown.shade800,
                        radius: 20, // Tamanho ajustado para 40x40 pixels
                        child: Text(
                          'VD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vlad Tepes Dracula',
                            style: AppTextStyles.body2.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'vlad.tepes@dracula.com',
                            style: AppTextStyles.body1.copyWith(
                              color: AppColors.brownLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Botão "Editar Perfil"
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenMain,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          minimumSize: const Size(120, 36),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text(
                          'Editar Perfil',
                          style: AppTextStyles.buttonBig.copyWith(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      // Botão "Remover Perfil"
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red, width: 1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          minimumSize: const Size(120, 36),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text(
                          'Remover Perfil',
                          style: AppTextStyles.buttonBig.copyWith(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Card com Data de Criação e Informações de Produtos Criados
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height: 155, // Altura fixa do card
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Juntou-se ao Weezy em:',
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '01 de janeiro de 2000',
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.brownLight,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Quantidade de Produtos Criados',
                    style: AppTextStyles.body2.copyWith(
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '01 Produto | 01 Fornecedor',
                    style: AppTextStyles.body1.copyWith(
                      color: AppColors.brownLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

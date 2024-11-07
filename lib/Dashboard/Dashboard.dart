import 'package:flutter/material.dart';
import 'package:agem/Our_tables/all_tables.dart';
import 'package:agem/main.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.white,
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.brownLight,
          tabs: const [
            Tab(text: 'TODOS'),
            Tab(text: 'TRANSAÇÕES'),
            Tab(text: 'USUÁRIOS'),
          ],
        ),
      ),
      body: Container(
        color: AppColors.backgroundBeige,
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildDashboardContent(),
            _buildTransactionsContent(),
            _buildUsersContent(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.greenMain,
        unselectedItemColor: AppColors.brownLight,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllTablesScreen()),
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bem vindo,',
              style:
                  AppTextStyles.subtitle.copyWith(color: AppColors.brownIcon),
            ),
            Text(
              'Vlad!',
              style: AppTextStyles.h2.copyWith(color: AppColors.greenDarker),
            ),
            const SizedBox(height: 24),
            Text(
              'Quantidade de Estoque',
              style: AppTextStyles.subtitle.copyWith(color: AppColors.grey),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildStockCard('Eucalipto', 34, 10),
                _buildStockCard('Pitu', 8, 12, isLowStock: true),
                _buildStockCard('Especie Bacana', 22, 8),
                _buildStockCard('Acácia', 10, 12, isLowStock: true),
                _buildStockCard('Carvalho', 12, 8),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Análise de Produtos',
              style: AppTextStyles.subtitle.copyWith(color: AppColors.grey),
            ),
            const SizedBox(height: 16),
            _buildProductAnalysisChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsContent() {
    return Center(
      child: Text(
        'Logs de Transação',
        style: AppTextStyles.h2.copyWith(color: AppColors.greenDarker),
      ),
    );
  }

  Widget _buildUsersContent() {
    return Center(
      child: Text(
        'Usuários Registrados',
        style: AppTextStyles.h2.copyWith(color: AppColors.greenDarker),
      ),
    );
  }

  Widget _buildStockCard(String productName, int quantity, int minQuantity,
      {bool isLowStock = false}) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: AppTextStyles.medium1.copyWith(color: AppColors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            'Quantidade: $quantity',
            style: AppTextStyles.body2.copyWith(
              color: isLowStock ? Colors.red : AppColors.black,
            ),
          ),
          Text(
            'Mínimo: $minQuantity',
            style: AppTextStyles.body2.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildProductAnalysisChart() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'Gráfico de Análise de Produtos',
          style: AppTextStyles.medium1.copyWith(color: AppColors.grey),
        ),
      ),
    );
  }
}

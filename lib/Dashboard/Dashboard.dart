import 'package:flutter/material.dart'; // Certifique-se de que esse widget foi implementado

class AppColors {
  static const backgroundBeige = Color(0xFFF4F3EE);
  static const white = Color(0xFFEFEEEB);
  static const grey = Color(0xFF153323);
  static const black = Color(0xFF151515);
  static const greenMain = Color(0xFF1D5637);
  static const greenDarker = Color(0xFF153323);
  static const brownIcon = Color(0xFF372E2A);
  static const brownMedium = Color(0xFF52483A);
  static const brownLight = Color(0xFF857E73);
}

class AppTextStyles {
  static const h1 = TextStyle(fontSize: 64, fontWeight: FontWeight.w600);
  static const h2 = TextStyle(fontSize: 48, fontWeight: FontWeight.w600);
  static const h3 = TextStyle(fontSize: 40, fontWeight: FontWeight.w600);
  static const subtitle = TextStyle(fontSize: 32, fontWeight: FontWeight.w600);
  static const buttonBig = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const buttonSmall =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static const body1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const body2 = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  static const medium1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const medium2 = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saudação
              Text(
                'Bem vindo,',
                style: AppTextStyles.body1.copyWith(color: AppColors.brownIcon),
              ),
              Text(
                'Vlad!',
                style: AppTextStyles.h2.copyWith(color: AppColors.greenMain),
              ),
              const SizedBox(height: 24),

              // Quantidade de Estoque Section
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

              // Análise de Produtos
              Text(
                'Análise de Produtos',
                style: AppTextStyles.subtitle.copyWith(color: AppColors.grey),
              ),
              const SizedBox(height: 16),
              _buildProductAnalysisChart(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.greenMain,
        unselectedItemColor: AppColors.brownLight,
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

  // Widget para os cartões de quantidade de estoque
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

  // Exemplo de gráfico de análise de produtos
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

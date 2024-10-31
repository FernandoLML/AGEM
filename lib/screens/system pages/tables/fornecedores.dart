import 'package:agem/core/colorFont.dart';
import 'package:flutter/material.dart';
import 'all_tables_screen.dart'; // Importação da tela AllTables
import 'tabelas_screen.dart'; // Importe a tela Tabelas

class FornecedoresScreen extends StatefulWidget {
  const FornecedoresScreen({super.key});

  @override
  _FornecedoresScreenState createState() => _FornecedoresScreenState();
}

class _FornecedoresScreenState extends State<FornecedoresScreen> {
  String _selectedTab =
      'FORNECEDORES'; // Estado inicial para selecionar "FORNECEDORES"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBeige,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 36,
                    color: AppColors.brownIcon,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Info',
                    style: TextStyle(
                      fontSize: 42,
                      color: AppColors.brownIcon,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    size: 36,
                    color: AppColors.brownIcon,
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.more_vert,
                    size: 36,
                    color: AppColors.brownIcon,
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
            section('Fornecedores', Icons.tag),
            fullWidthDivider(),
            itemDetails('Chum Bucket', 'Vlad'),
            fullWidthDivider(),
            itemDetails('Siri Cascudo', 'Vlad'),
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
          if (tabName == 'TODOS') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AllTablesScreen(),
              ),
            );
          } else if (tabName == 'TABELAS') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TabelasScreen(),
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

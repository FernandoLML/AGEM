import 'package:agem/core/colorFont.dart';
import 'package:flutter/material.dart';

class AllTablesScreen extends StatelessWidget {
  const AllTablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBeige,
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
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
                    color: Colors.black,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Info',
                    style: TextStyle(
                      fontSize: 42,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    size: 36,
                    color: Colors.black,
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.more_vert,
                    size: 36,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'TODOS',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.greenMain,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'TABELAS',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.brownIcon,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'FORNECEDORES',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.brownIcon,
                      ),
                    ),
                  ),
                ),
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

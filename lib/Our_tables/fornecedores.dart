import 'package:agem/Colors_and_Fonts/colorsFont.dart';
import 'package:flutter/material.dart';

class FornecedoresScreen extends StatelessWidget {
   FornecedoresScreen({super.key});

  final List<Map<String, String>> fornecedores = [
    {'nome': 'Fornecedor 1', 'criador': 'Vlad'},
    {'nome': 'Fornecedor 2', 'criador': 'Machado de Assis'},
    {'nome': 'Fornecedor 3', 'criador': 'Machado de Assis'},
    {'nome': 'Fornecedor 4', 'criador': 'Vlad'},
    {'nome': 'Fornecedor 5', 'criador': 'Vlad'},
    {'nome': 'Fornecedor 6', 'criador': 'Machado de Assis'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundBeige,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            fullWidthDivider(),
            section('Fornecedores', Icons.tag),
            fullWidthDivider(),
            // Construindo os itens dinamicamente a partir da lista
            ...fornecedores.map((fornecedor) {
              return Column(
                children: [
                  itemDetails(fornecedor['nome']!, fornecedor['criador']!),
                  fullWidthDivider(),
                ],
              );
            }).toList(),
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
      padding: const EdgeInsets.all(16.0),
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
      padding: const EdgeInsets.all(16.0),
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

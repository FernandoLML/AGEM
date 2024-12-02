import 'package:flutter/material.dart';
import 'all_tables.dart';
import 'tabelas_screen.dart';
import 'fornecedores.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Três abas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
        backgroundColor: const Color(0xFF1D5637),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'TODOS'),
            Tab(text: 'TABELAS'),
            Tab(text: 'FORNECEDORES'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [ 
          AllTablesScreen(),
          TabelasScreen(),
          FornecedoresScreen(),
        ],
      ),
    );
  }
}
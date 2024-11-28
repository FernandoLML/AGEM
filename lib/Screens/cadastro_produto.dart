import 'package:flutter/material.dart';
import 'package:agem/Colors_and_Fonts/colorsFont.dart';

class CadastroProdutoScreen extends StatefulWidget {
  @override
  _CadastroProdutoScreenState createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
  // Controladores para os campos de texto
  final TextEditingController _especieController = TextEditingController();
  final TextEditingController _comprimentoController = TextEditingController();
  final TextEditingController _larguraController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _fornecedorController = TextEditingController();
  final TextEditingController _custoController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  // Chave global para validação do formulário
  final _formKey = GlobalKey<FormState>();

  // Lógica para salvar os dados
  void _cadastrarProduto() {
    if (_formKey.currentState!.validate()) {
      // TODO: Adicione a lógica de cadastro aqui
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Produto cadastrado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      // Limpar campos após o cadastro
      _especieController.clear();
      _comprimentoController.clear();
      _larguraController.clear();
      _quantidadeController.clear();
      _fornecedorController.clear();
      _custoController.clear();
      _dataController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenMain,
        title: const Text(
          'Cadastro de Produto',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundBeige,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Campo: Espécie da Madeira
              _buildTextField(
                controller: _especieController,
                label: 'Espécie da Madeira',
                hint: 'Ex.: Mogno',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe a espécie da madeira';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo: Comprimento
              _buildTextField(
                controller: _comprimentoController,
                label: 'Comprimento (metros)',
                hint: 'Ex.: 2.5',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o comprimento';
                  }
                  if (double.tryParse(value) == null) {
                    return 'O comprimento deve ser numérico';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo: Largura
              _buildTextField(
                controller: _larguraController,
                label: 'Largura (milímetros)',
                hint: 'Ex.: 500',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a largura';
                  }
                  if (double.tryParse(value) == null) {
                    return 'A largura deve ser numérica';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo: Quantidade de Material
              _buildTextField(
                controller: _quantidadeController,
                label: 'Quantidade de Material',
                hint: 'Ex.: 10 peças',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a quantidade';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo: Fornecedor
              _buildTextField(
                controller: _fornecedorController,
                label: 'Fornecedor',
                hint: 'Ex.: Madeireira XYZ',
              ),
              const SizedBox(height: 16),

              // Campo: Custo
              _buildTextField(
                controller: _custoController,
                label: 'Custo (em R\$)',
                hint: 'Ex.: 150.00',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o custo';
                  }
                  if (double.tryParse(value) == null) {
                    return 'O custo deve ser numérico';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo: Data
              _buildTextField(
                controller: _dataController,
                label: 'Data',
                hint: 'Ex.: 27/11/2024',
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 24),

              // Botão: Cadastrar Produto
              ElevatedButton(
                onPressed: _cadastrarProduto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenMain,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Cadastrar Produto',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para criar campos de texto reutilizáveis
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: validator,
    );
  }
}
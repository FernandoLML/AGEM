import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:agem/Colors_and_Fonts/colorsFont.dart';
import 'package:agem/Dashboard/Dashboard.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signup() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

    try {
      // Cria o usuário no Supabase Auth
      final response = await Supabase.instance.client.auth
          .signUp(email: email, password: password);

      if (response.user != null) {
        // Após criar o usuário, salva o nome na tabela "usuario"
        await Supabase.instance.client.from('usuario').insert({
          'id_usuario_uuid': response.user!.id, 
          'email': email,
          'nome': name,
          'data_criacao': DateTime.now().toIso8601String(),
          'verificado': false,
        });

        // Redireciona para o Dashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: ${e.message}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro inesperado: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBeige,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Botão de voltar
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(Icons.arrow_back, color: AppColors.greenDarker),
                  const SizedBox(width: 8),
                  Text(
                    'Voltar',
                    style: AppTextStyles.body1
                        .copyWith(color: AppColors.greenDarker),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Header "Sign Up"
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: AppTextStyles.h2.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 8),

                  // Subtítulo
                  Text(
                    'Insira seus dados de cadastro',
                    style: AppTextStyles.body1.copyWith(color: AppColors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Campo de texto "Nome"
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle:
                    AppTextStyles.body1.copyWith(color: AppColors.brownMedium),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.person, color: AppColors.brownMedium),
              ),
            ),
            const SizedBox(height: 16),

            // Campo de texto "Email"
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Insira seu email',
                labelStyle:
                    AppTextStyles.body1.copyWith(color: AppColors.brownMedium),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.email, color: AppColors.brownMedium),
              ),
            ),
            const SizedBox(height: 16),

            // Campo de texto "Senha"
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Insira sua senha',
                labelStyle:
                    AppTextStyles.body1.copyWith(color: AppColors.brownMedium),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.lock, color: AppColors.brownMedium),
              ),
            ),
            const SizedBox(height: 24),

            // Botão de cadastro
            ElevatedButton(
              onPressed: _signup,
              child: Text(
                'Criar conta',
                style: AppTextStyles.buttonBig.copyWith(color: AppColors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenMain,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:agem/Colors_and_Fonts/colorsFont.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

 // Importando o AppColors e AppTextStyles
// Se precisar usar o tema inteiro

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos.')),
      );
      return;
    }

    try {
      final response = await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);

      if (response.user != null) {
        // Login bem-sucedido
        Navigator.pushReplacementNamed(context, '/dashboard'); // Rota após login
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(Icons.access_time, size: 100, color: AppColors.brownIcon),
              const SizedBox(height: 16),

              // Nome do app
              Text(
                "WEEZY",
                style: AppTextStyles.h2.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 16),

              // Campo de email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Insira seu email',
                  labelStyle: AppTextStyles.body1
                      .copyWith(color: AppColors.brownMedium),
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon:
                      Icon(Icons.email, color: AppColors.brownMedium),
                ),
              ),
              const SizedBox(height: 16),

              // Campo de senha
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Insira sua senha',
                  labelStyle: AppTextStyles.body1
                      .copyWith(color: AppColors.brownMedium),
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon:
                      Icon(Icons.lock, color: AppColors.brownMedium),
                ),
              ),
              const SizedBox(height: 8),

              // Link para esquecer senha
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Esqueceu sua senha?',
                  style: AppTextStyles.body2
                      .copyWith(color: AppColors.greenDarker),
                ),
              ),
              const SizedBox(height: 24),

              // Botão de login
              ElevatedButton(
                onPressed: _login,
                child: Text(
                  'Entrar',
                  style: AppTextStyles.buttonBig
                      .copyWith(color: AppColors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greenMain,
                  minimumSize:
                      Size(double.infinity, 48), // Largura total do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Criar conta
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup'); // Rota de criar conta
                },
                child: Text(
                  'Não tem uma conta? Criar conta',
                  style: AppTextStyles.body1
                      .copyWith(color: AppColors.greenDarker),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

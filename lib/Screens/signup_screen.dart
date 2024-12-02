import 'package:agem/Dashboard/Dashboard.dart';
import 'package:agem/main.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
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

            // Botão de login que redireciona para o Dashboard
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
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
            const SizedBox(height: 16),

            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: AppColors.brownMedium, // Adjust the color as needed
                    thickness: 1,                // Adjust the thickness as needed
                    endIndent: 8,                // Adds spacing between the line and text
                  ),
                ),
                Text(
                  "ou",
                  style: AppTextStyles.body1.copyWith(color: AppColors.brownMedium),
                ),
                const Expanded(
                  child: Divider(
                    color: AppColors.brownMedium, // Adjust the color as needed
                    thickness: 1,                // Adjust the thickness as needed
                    indent: 8,                   // Adds spacing between the line and text
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Center(
              child: Text(
                "Continue com",
                style: AppTextStyles.body1.copyWith(
                  color: AppColors.brownMedium,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),


            const SizedBox(height: 16),

            // Botão de login com Google que também redireciona para o Dashboard
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
              },
              icon: Icon(Icons.login, color: AppColors.white),
              label: Text(
                'Entrar com Google',
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

import 'package:agem/core/colorFont.dart'; // Import the color constants
import 'package:agem/screens/system%20pages/tables/all_tables_screen.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/textField.dart';
import '../system pages/tables/fornecedores.dart'; // Import the target screen
import '../login pages/signIn_screen.dart'; // Import the sign-in screen

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBeige,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo Image
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: Image.asset(
                  '../../assets/img/logo.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Title Text
            const Text(
              'WEEZY',
              style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: AppColors.brownIcon,
              ),
            ),
            const SizedBox(height: 32),
            // Informational Text
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informe seus dados',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.brownIcon,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Email Field
            const FilledTextFieldExample(
              labelText: "Email",
              hintText: "Insira seu email",
            ),
            const SizedBox(height: 16),
            // Password Field
            const FilledTextFieldExample(
              labelText: "Senha",
              hintText: "Insira sua senha",
            ),
            const SizedBox(height: 8),
            // "Forgot Password" text
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Esqueceu sua senha?',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.brownIcon,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Login Button with Navigation and custom color
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.greenMain,
                padding: const EdgeInsets.all(4), // Definindo padding de 4
                minimumSize:
                    const Size.fromHeight(48), // Definindo altura do botão
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllTablesScreen(),
                  ),
                );
              },
              child:
                  const Text("Login", style: TextStyle(color: AppColors.white)),
            ),
            const Spacer(),
            // "Don't have an account? Sign in" text with navigation, moved up by 50px
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0), // Move up by 50px
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greenMain,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.greenMain,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

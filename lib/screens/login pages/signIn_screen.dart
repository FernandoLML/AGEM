import 'package:agem/core/colorFont.dart';
import 'package:agem/screens/system%20pages/tables/all_tables_screen.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/textField.dart';
import '../system pages/tables/fornecedores.dart'; // Import the target screen

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                color: Colors.black,
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
                  color: Colors.brown,
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
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Login Button with Navigation
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllTablesScreen(),
                  ),
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

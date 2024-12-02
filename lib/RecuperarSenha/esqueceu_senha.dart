import 'package:agem/Dashboard/Dashboard.dart';
import 'package:agem/main.dart';
import 'package:flutter/material.dart';
import 'recuperar_codigo.dart';

class ForgotPassword extends StatelessWidget {
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
                  const SizedBox(width: 12),
                  Text(
                    'Voltar',
                    style: AppTextStyles.body1
                        .copyWith(color: AppColors.greenDarker),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Rounded square icon with a border and padding
                  Container(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(8), // Padding to float the icon
                    decoration: BoxDecoration(
                      color: AppColors.white, // Background color for the icon
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                      border: Border.all(
                        color: AppColors.brownMedium, // Border color
                        width: 4, // Border width
                      ),
                    ),
                    child: Image.asset(
                      '../../assets/img/fingerprint.png',
                      fit: BoxFit.contain, // Ensures the image fits within the padding
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title
                  Text(
                    'Esqueceu a Senha?',
                    style: AppTextStyles.h2.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 8),

                  // Subtitle
                  Text(
                    'Sem problemas, vamos te ajudar a recuperá-la.',
                    style: AppTextStyles.body1.copyWith(color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 100),

                  // Campos de texto
                  TextField(
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
                      prefixIcon: Icon(Icons.email, color: AppColors.brownMedium),
                    ),
                  ),
                  
                  const SizedBox(height: 24),

                  // Link para esquecer senha
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Registre-se!',
                        style: AppTextStyles.body2
                            .copyWith(color: AppColors.greenDarker),
                      ),
                    )
                  ),
                  const SizedBox(height: 100),
                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecuperarCodigo()),
                      );
                    },
                    child: Text(
                      'Recuperar',
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
                  const SizedBox(height: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // First (fully opaque green) rectangle
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.greenMain,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      // Remaining (semi-transparent green) rectangles
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.greenMain.withOpacity(0.3), // Semi-transparent green
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.greenMain.withOpacity(0.3), // Semi-transparent green
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.greenMain.withOpacity(0.3), // Semi-transparent green
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

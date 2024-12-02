import 'package:agem/Dashboard/Dashboard.dart';
import 'package:agem/main.dart';
import 'package:flutter/material.dart';
import 'nova_senha.dart';

class RecuperarCodigo extends StatelessWidget {
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
                      '../../assets/img/email.png',
                      fit: BoxFit.contain, // Ensures the image fits within the padding
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    'Recuperar a Senha',
                    style: AppTextStyles.h2.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 8),

                  // Subtitle
                  Text(
                    'Nós enviamos o código para vlad@dracula.com',
                    style: AppTextStyles.body1.copyWith(color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40), // Space between subtitle and input fields

                  // Row with four big boxes for entering the confirmation code
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCodeBox(),
                      _buildCodeBox(),
                      _buildCodeBox(),
                      _buildCodeBox(),
                    ],
                  ),

                  const SizedBox(height: 100),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NovaSenha()),
                      );
                    },
                    child: Text(
                      'Continuar',
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

                  const SizedBox(height: 24),

                  // RichText with green text and bold "Clique aqui"
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.body1.copyWith(color: AppColors.greenDarker),
                        children: [
                          TextSpan(text: "Não recebeu o email? "),
                          TextSpan(
                            text: "Clique aqui",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // "De volta ao login" text with < symbol, wrapped in GestureDetector for navigation
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate back to the main screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()), // Assuming MyApp is the entry point
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('<', style: AppTextStyles.body1.copyWith(color: AppColors.grey, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 4),
                          Text(
                            'De volta ao login',
                            style: AppTextStyles.body1.copyWith(color: AppColors.grey, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Progress bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // First (fully opaque green) rectangle
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.greenMain.withOpacity(0.2),
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
                            color: AppColors.greenMain, // Semi-transparent green
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.greenMain.withOpacity(0.2), // Semi-transparent green
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.greenMain.withOpacity(0.2), // Semi-transparent green
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to create individual code input boxes
  Widget _buildCodeBox() {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.brownMedium,
          width: 2,
        ),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        style: AppTextStyles.h2.copyWith(color: AppColors.black),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}

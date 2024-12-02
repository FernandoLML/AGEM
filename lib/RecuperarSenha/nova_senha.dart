import 'package:agem/Dashboard/Dashboard.dart';
import 'package:agem/main.dart';
import 'package:flutter/material.dart';

class NovaSenha extends StatelessWidget {
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
                    'Crie uma nova Senha',
                    style: AppTextStyles.h2.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 8),

                  // Subtitle
                  Text(
                    'Deve conter no mínimo 8 caractéres',
                    style: AppTextStyles.body1.copyWith(color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  // Password Input Field
                  TextField(
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
                      prefixIcon: Icon(Icons.email, color: AppColors.brownMedium),
                    ),
                  ),

                  // "Segurança da senha" text
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Segurança da senha',
                      style: AppTextStyles.body1
                          .copyWith(color: AppColors.brownLight),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Mediana',
                      style: AppTextStyles.body1
                          .copyWith(color: AppColors.greenDarker),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.brownLight.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.brownLight,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.brownLight.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: AppColors.brownLight.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24,),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Sua senha é fácil de adivinhar. Você consegue fazer melhor!',
                      style: AppTextStyles.body1
                          .copyWith(color: AppColors.brownLight),
                    ),
                  ),

                  const SizedBox(height: 24,),

                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Confirme a senha',
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

                  const SizedBox(height: 40,),

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

                  const SizedBox(height: 60,),

                  // Password strength indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
}

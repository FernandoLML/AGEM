import 'package:agem/Our_tables/fornecedores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:agem/Dashboard/Dashboard.dart';
import 'package:agem/screens/signup_screen.dart';
import 'package:agem/Screens/cadastro_produto.dart';
import 'package:agem/RecuperarSenha/esqueceu_senha.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hvlhdutltkzwsbjswxiv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh2bGhkdXRsdGt6d3NianN3eGl2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzEwMjQ4MTQsImV4cCI6MjA0NjYwMDgxNH0.BHvi6DIs6pNI3uDRLHRzaJ4vHwLYLmBfFp8bUhjsNjs',
  );
  runApp(MyApp());
}

class AppColors {
  static const backgroundBeige = Color(0xFFF4F3EE);
  static const white = Color(0xFFEFEEEB);
  static const grey = Color(0xFF153323);
  static const black = Color(0xFF151515);
  static const greenMain = Color(0xFF1D5637);
  static const greenDarker = Color(0xFF153323);
  static const brownIcon = Color(0xFF372E2A);
  static const brownMedium = Color(0xFF52483A);
  static const brownLight = Color(0xFF857E73);
}

class AppTextStyles {
  static const h1 = TextStyle(fontSize: 64, fontWeight: FontWeight.w600);
  static const h2 = TextStyle(fontSize: 48, fontWeight: FontWeight.w600);
  static const h3 = TextStyle(fontSize: 40, fontWeight: FontWeight.w600);
  static const subtitle = TextStyle(fontSize: 32, fontWeight: FontWeight.w600);
  static const buttonBig = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const buttonSmall =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static const body1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const body2 = TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  static const medium1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const medium2 = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WEEZY App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/signup': (context) => SignupScreen(),
        '/cadastro_produto': (context) => CadastroProdutoScreen(), // Nova rota
        '/fornecedores': (context) => FornecedoresScreen(),
        '/esqueceu_senha': (context) => ForgotPassword(),
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
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
              // Logo SVG
              SvgPicture.asset(
                'assets/img/logo.svg',
                height: 128,
              ),
              const SizedBox(height: 16),

              // Nome do app
              Text(
                "WEEZY",
                style: AppTextStyles.h2.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 16),

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
              const SizedBox(height: 16),
              TextField(
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
                  prefixIcon: Icon(Icons.lock, color: AppColors.brownMedium),
                ),
              ),
              const SizedBox(height: 8),

              // Link para esquecer senha
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/esqueceu_senha');
                  },
                  child: Text(
                    'Esqueceu sua senha?',
                    style: AppTextStyles.body2
                        .copyWith(color: AppColors.greenDarker),
                  ),
                )
              ),
              const SizedBox(height: 24),

              // Botão de login que redireciona para o Dashboard
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: Text(
                  'Log in',
                  style:
                      AppTextStyles.buttonBig.copyWith(color: AppColors.white),
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


              const SizedBox(height: 24),

              // Botão de login com Google que também redireciona para o Dashboard
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                icon: Icon(Icons.login, color: AppColors.white),
                label: Text(
                  'Sign in with Google',
                  style:
                      AppTextStyles.buttonBig.copyWith(color: AppColors.white),
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

              // Criar conta
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
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
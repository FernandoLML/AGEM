import 'package:flutter/material.dart';
import '../../core/widgets/textField.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using the FilledTextFieldExample from textField.dart
            const FilledTextFieldExample(),
            const SizedBox(height: 16),
            const FilledTextFieldExample(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Add logic to handle login
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

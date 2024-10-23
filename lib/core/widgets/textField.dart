import 'package:flutter/material.dart';
import '../colorFont.dart';

class FilledTextFieldExample extends StatefulWidget {
  const FilledTextFieldExample({super.key});

  @override
  _FilledTextFieldExampleState createState() => _FilledTextFieldExampleState();
}

class _FilledTextFieldExampleState extends State<FilledTextFieldExample> {
  // Create a FocusNode property
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Listen to the focus changes to trigger updates in the UI
    _focusNode.addListener(() {
      setState(() {}); // Rebuild the widget when focus state changes
    });
  }

  @override
  void dispose() {
    // Clean up the focus node when the widget is disposed
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Request focus on tap
        _focusNode.requestFocus();
      },
      child: TextField(
        focusNode: _focusNode,
        style: AppTextStyles.buttonBig,
        obscureText: true,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          suffixIcon: Icon(Icons.clear),
          labelText: 'Filled',
          labelStyle: _focusNode.hasFocus
              ? const TextStyle(
                  color: AppColors.greenMain, // Focused label text color
                  fontSize: 16, // Matches buttonBig size
                  fontWeight: FontWeight.w600, // Matches buttonBig weight
                )
              : AppTextStyles.buttonBig, // Default label text style
          hintText: 'hint text',
          hintStyle:
              AppTextStyles.buttonSmall, // Hint text style (smaller font)

          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.grey), // Default border color
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.greenMain, width: 2.0), // Focused border color
          ),
        ),
      ),
    );
  }
}

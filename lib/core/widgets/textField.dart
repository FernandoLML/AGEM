import 'package:flutter/material.dart';
import '../colorFont.dart';

class FilledTextFieldExample extends StatefulWidget {
  final String labelText; // New property for label text
  final String hintText; // New property for hint text

  const FilledTextFieldExample({
    Key? key,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);

  @override
  _FilledTextFieldExampleState createState() => _FilledTextFieldExampleState();
}

class _FilledTextFieldExampleState extends State<FilledTextFieldExample> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // Rebuild the widget when focus state changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
      },
      child: TextField(
        focusNode: _focusNode,
        style: AppTextStyles.buttonBig,
        obscureText: false, // Change to true if you want to obscure text (e.g., for password)
        decoration: InputDecoration(
          fillColor: AppColors.white,
          suffixIcon: const Icon(Icons.clear),
          labelText: widget.labelText, // Use the new labelText property
          labelStyle: _focusNode.hasFocus
              ? const TextStyle(
                  color: AppColors.greenMain,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
              : AppTextStyles.buttonBig,
          hintText: widget.hintText, // Use the new hintText property
          hintStyle: AppTextStyles.buttonSmall,
          filled: true,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.greenMain, width: 2.0),
          ),
        ),
      ),
    );
  }
}

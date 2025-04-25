import 'package:flutter/material.dart';


class UTextFilled extends StatelessWidget {
  const UTextFilled({
    super.key,
    required this.hint,
    this.startIcon,
    this.isPassword = false,
    this.autoFocus = false,
    this.endIcon,
    this.onTap,
    this.onChanged,
    this.focusNode,
    this.width = double.infinity,
    this.readOnly = false,
    this.keyBoardType = TextInputType.text,
    this.validator,
    this.errorText = "",
    this.initialValue = "",
    this.textEditingController,
    this.prefixText,
    required this.isDarkMode,
  });

  final String hint, errorText;
  final Widget? startIcon, endIcon;
  final bool isPassword, autoFocus, readOnly;
  final VoidCallback? onTap;
  final void onChanged;
  final FocusNode? focusNode;
  final String? initialValue;
  final String? prefixText;
  final double width;
  final bool isDarkMode;
  final TextEditingController? textEditingController;

  final String? Function(String?)? validator;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
      controller: textEditingController,
      validator: validator,
      autofocus: autoFocus,
      focusNode: focusNode,
      keyboardType: keyBoardType,
      textAlign: TextAlign.left,
      cursorColor: Colors.black,
      obscureText: isPassword,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          prefixText: prefixText,
          prefixIcon: startIcon,
          suffixIcon: endIcon,
          hintStyle: const TextStyle(color: Colors.black45),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}

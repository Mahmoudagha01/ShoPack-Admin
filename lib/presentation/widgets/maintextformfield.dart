import 'package:flutter/material.dart';

class MainTFF extends StatelessWidget {
  const MainTFF({
    Key? key,
    this.prefix,
    this.suffix,
    required this.controller,
    required this.validate,
    required this.isPassword,
    required this.borderRadius,
    this.readOnly,
    required this.inputType,
    this.hintText,
    this.labelText,
    this.textAlign,
    required this.border,
    this.suffixPressed,
    required this.max,
  }) : super(key: key);

  final IconData? prefix;
  final Widget? suffix;
  final TextEditingController controller;
  final bool isPassword;
  final double? borderRadius;
  final bool? readOnly;
  final int max;
  final TextInputType inputType;
  final String? hintText;
  final String? labelText;
  final TextAlign? textAlign;
  final InputBorder border;
  final Function()? suffixPressed;
  final String? Function(String?)? validate;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.5,
      child: TextFormField(
        maxLines: max,
        obscureText: isPassword,
        keyboardType: inputType,
        controller: controller,
        validator: validate,
        decoration: InputDecoration(
            suffixIcon: suffix,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 23, horizontal: 20),
            label: Text(labelText!),
      alignLabelWithHint: true,
            border: border),
      ),
    );
  }
}

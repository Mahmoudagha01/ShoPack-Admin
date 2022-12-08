import 'package:flutter/material.dart';

showSnackbar(String message, context, Color color) {
  final snackbar = SnackBar(
    content: Text(message,style: const TextStyle(fontWeight: FontWeight.bold),),
    duration: const Duration(seconds: 2),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

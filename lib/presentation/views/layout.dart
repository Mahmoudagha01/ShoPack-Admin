import 'package:flutter/material.dart';
import 'package:shopack_admin/core/helper/local/shared_preference.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(PreferenceHelper.getDataFromSharedPreference(key: "token")),);
  }
}
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:wordgame/pages/homepage.dart';

void main() async {
  runApp(const word());
}

class word extends StatelessWidget {
  const word({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kooc_barma/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'KOCC BARMA',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

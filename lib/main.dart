import 'package:flutter/material.dart';
import 'package:shop/views/gorcery_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromARGB(255, 74, 77, 84),
      ),
      home: const GorceryView(),
    );
  }
}

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "No Item Add yet",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ));
  }
}

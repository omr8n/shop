import 'package:flutter/material.dart';

class CategoryModels {
  CategoryModels(
    this.title,
    this.color,
  );

  final String title;
  final Color color;
}

enum Categories {
  vegetables,
  fruite,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}

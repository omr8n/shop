import 'package:flutter/material.dart';
import 'package:shop/models/category_models.dart';

Map<Categories, CategoryModels> categories = {
  Categories.vegetables: CategoryModels(
    'Vegetables',
    const Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruite: CategoryModels(
    'Fruit',
    const Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: CategoryModels(
    'Meat',
    const Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: CategoryModels(
    'Dairy',
    const Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: CategoryModels(
    'Carbs',
    const Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: CategoryModels(
    'Sweets',
    const Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: CategoryModels(
    'Spices',
    const Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: CategoryModels(
    'Convenience',
    const Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: CategoryModels(
    'Hygiene',
    const Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: CategoryModels(
    'Other',
    const Color.fromARGB(255, 0, 225, 255),
  ),
};

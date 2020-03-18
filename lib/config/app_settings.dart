// flutter imports
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/domain/models/category_model.dart';

/// app basic info
const app = {'name': 'E-Commerce', 'version': '0.0.1'};

//// Product Categories
final categories = [
  CategoryModel(iconData: Icons.directions_car, name: 'Car'),
  CategoryModel(iconData: Icons.directions_bike, name: 'Bike'),
  CategoryModel(iconData: Icons.directions_boat, name: 'Boat'),
];

// cache
final bool cacheEnabled = true;

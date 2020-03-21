// flutter imports
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';

@immutable
abstract class ProductRepository {
  Future<List<ProductModel>> getProducts(String category);
}

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/domain/repositories/product/product_repository.dart';

class ProductFirestoreRepository extends ProductRepository {
  @override
  Future<List<ProductModel>> getProducts(String category) async {
    return Future.delayed(Duration(seconds: 4), () {
      return [
        ProductModel(
            name: 'Lenovo x280',
            price: '\$ 1399',
            discount: '-37%',
            images: ['assets/images/lenovo.jpg']),
        ProductModel(
            name: 'Lenovo x280',
            price: '\$ 1399',
            discount: '-37%',
            images: ['assets/images/lenovo.jpg']),
        ProductModel(
            name: 'Lenovo x280',
            price: '\$ 1399',
            discount: '-37%',
            images: ['assets/images/lenovo.jpg']),
        ProductModel(
            name: 'Lenovo x280',
            price: '\$ 1399',
            discount: '-37%',
            images: ['assets/images/lenovo.jpg'])
      ];
    });
  }
}

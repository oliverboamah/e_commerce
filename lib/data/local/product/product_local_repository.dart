// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/domain/repositories/product/product_repository.dart';

class ProductLocalRepository extends ProductRepository {
  @override
  Future<List<ProductModel>> getProducts(String category) async {
    int price;

    if (category == 'category1') {
      price = 2399;
    } else if (category == 'category2') {
      price = 100;
    } else {
      price = 35000;
    }

    return Future.delayed(Duration(seconds: 4), () {
      return [
        ProductModel(
            name: 'Lenovo x280',
            price: '\$$price',
            discount: '-37%',
            images: ['assets/images/lenovo.jpg']),
        ProductModel(
            name: 'Lenovo x280',
            price: '\$$price',
            discount: '-37%',
            images: ['assets/images/lenovo.jpg']),
        ProductModel(
            name: 'Lenovo x280',
            price: '\$$price',
            discount: '-37%',
            images: ['assets/images/lenovo.jpg']),
        ProductModel(
          name: 'Lenovo x280',
          price: '\$$price',
          discount: '-37%',
          images: ['assets/images/lenovo.jpg'],
        ),
        ProductModel(
          name: 'Lenovo x280',
          price: '\$$price',
          discount: '-37%',
          images: ['assets/images/lenovo.jpg'],
        ),
        ProductModel(
          name: 'Lenovo x280',
          price: '\$$price',
          discount: '-37%',
          images: ['assets/images/lenovo.jpg'],
        ),
        ProductModel(
          name: 'Lenovo x280',
          price: '\$$price',
          discount: '-37%',
          images: ['assets/images/lenovo.jpg'],
        ),
        ProductModel(
          name: 'Lenovo x280',
          price: '\$$price',
          discount: '-37%',
          images: ['assets/images/lenovo.jpg'],
        ),
        ProductModel(
          name: 'Lenovo x280',
          price: '\$$price',
          discount: '-37%',
          images: ['assets/images/lenovo.jpg'],
        ),
        ProductModel(
          name: 'Lenovo x280',
          price: '\$$price',
          discount: '-37%',
          images: ['assets/images/lenovo.jpg'],
        ),
        ProductModel(
          name: 'Lenovo x280',
          price: '\$$price',
          discount: '-37%',
          images: ['assets/images/lenovo.jpg'],
        ),
        ProductModel(
          name: 'Lenovo x280',
          price: '\$$price',
          discount: '-37%',
          images: ['assets/images/lenovo.jpg'],
        )
      ];
    });
  }
}

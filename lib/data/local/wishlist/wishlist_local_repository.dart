// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/domain/repositories/wishlist/wishlist_repository.dart';

class WishlistLocalRepository extends WishlistRepository {
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final int price = 2399;

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

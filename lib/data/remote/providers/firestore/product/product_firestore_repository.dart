// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/domain/repositories/product/product_repository.dart';

class ProductFirestoreRepository extends ProductRepository {
  @override
  Future<List<ProductModel>> getProducts(
      String category, int productId, int numToLoad) async {
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
            price: '$price',
            discount: '-37%',
            images: ['assets/images/lenovo.jpg'],
            deliveryInfoLine1: 'Express delivery in main cities',
            deliveryInfoLine2: 'Delivered by thursday 2 Jan',
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            deliveryInfoLine1: 'Express delivery in main cities',
            deliveryInfoLine2: 'Delivered by thursday 2 Jan',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            deliveryInfoLine1: 'Express delivery in main cities',
            deliveryInfoLine2: 'Delivered by thursday 2 Jan',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            deliveryInfoLine1: 'Express delivery in main cities',
            deliveryInfoLine2: 'Delivered by thursday 2 Jan',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            deliveryInfoLine1: 'Express delivery in main cities',
            deliveryInfoLine2: 'Delivered by thursday 2 Jan',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            deliveryInfoLine1: 'Express delivery in main cities',
            deliveryInfoLine2: 'Delivered by thursday 2 Jan',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            deliveryInfoLine1: 'Express delivery in main cities',
            deliveryInfoLine2: 'Delivered by thursday 2 Jan',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            deliveryInfoLine1: 'Express delivery in main cities',
            deliveryInfoLine2: 'Delivered by thursday 2 Jan',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            deliveryInfoLine1: 'Express delivery in main cities',
            deliveryInfoLine2: 'Delivered by thursday 2 Jan',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
        ProductModel(
            name: 'Lenovo x280',
            price: '$price',
            discount: '-37%',
            deliveryInfoLine1: 'Express delivery in main cities',
            deliveryInfoLine2: 'Delivered by thursday 2 Jan',
            images: ['assets/images/lenovo.jpg'],
            detail:
                '- Display 12.4’” HD, retina display \n- Memory: 256 SSD, 16 GB RAM'),
      ];
    });
  }
}

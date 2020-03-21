// flutter imports
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/data/local/product/product_local_repository.dart';
import 'package:e_commerce/data/remote/providers/firestore/product/product_firestore_repository.dart';
import 'package:e_commerce/data/remote/providers/remote_data_provider.dart';
import 'package:e_commerce/domain/models/product_model.dart';

class ProductRepositoryFactory {
  final RemoteDataProvider remoteDataProvider;
  ProductLocalRepository _productLocalRepository;
  ProductFirestoreRepository _productFirestoreRepository;
  bool _internetConnected = true;

  ProductRepositoryFactory({@required this.remoteDataProvider}) {
    this._productLocalRepository = ProductLocalRepository();
    this._productFirestoreRepository = ProductFirestoreRepository();
  }

  Future<List<ProductModel>> getProducts(
      String category, int productId, int numToLoad) async {
    if (!_internetConnected) {
      List<ProductModel> products = await this
          ._productLocalRepository
          .getProducts(category, productId, numToLoad);

      if (products.isNotEmpty) {
        return products;
      }
    }

    switch (this.remoteDataProvider) {
      case RemoteDataProvider.firebase:
        return await this
            ._productFirestoreRepository
            .getProducts(category, productId, numToLoad);
        break;
      default:
        return await this
            ._productFirestoreRepository
            .getProducts(category, productId, numToLoad);
    }
  }
}

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/data/local/wishlist/wishlist_local_repository.dart';

class WishlistRepositoryFactory {
  WishlistLocalRepository _wishlistRepository;

  WishlistRepositoryFactory() {
    this._wishlistRepository = WishlistLocalRepository();
  }

  Future<List<ProductModel>> getAllProducts() async {
    return await _wishlistRepository.getAllProducts();
  }
}

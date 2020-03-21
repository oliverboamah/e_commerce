// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/data/factories/wishlist/wishlist_repository_factory.dart';
import 'package:e_commerce/presentation/features/home/tabs/wishlist/wishlist_event.dart';
import 'package:e_commerce/presentation/features/home/tabs/wishlist/wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepositoryFactory _wishlistRepositoryFactory =
      WishlistRepositoryFactory();

  @override
  WishlistState get initialState => WishlistInitialState(products: []);

  @override
  Stream<WishlistState> mapEventToState(WishlistEvent event) async* {
    if (event is LoadWishlistEvent) {
      List<ProductModel> products =
          await _wishlistRepositoryFactory.getAllProducts();

      yield WishlistLoadedState(products: products);
    }
  }
}

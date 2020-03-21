// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/home/tabs/product/product_event.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/product_state.dart';
import 'package:e_commerce/data/factories/product_repository_factory.dart';
import 'package:e_commerce/data/remote/providers/remote_data_provider.dart';
import 'package:e_commerce/domain/models/product_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepositoryFactory productRepositoryFactory =
      ProductRepositoryFactory(remoteDataProvider: RemoteDataProvider.firebase);

  @override
  ProductState get initialState => ProductInitialState(products: []);

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProductsEvent) {
      List<ProductModel> products = this.state.products;
      List<ProductModel> newProducts =
          await productRepositoryFactory.getProducts(event.category,
              state.products.isNotEmpty ? state.products.last.id : 0, 0);

      products.addAll(newProducts);

      yield ProductsLoadedState(
          products: products,
          lastProductId: products.last.id,
          productsHashCode: DateTime.now().toIso8601String());
    }
  }
}

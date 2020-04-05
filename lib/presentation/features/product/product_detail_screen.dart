// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/product/views/product_detail_view.dart';
import 'package:e_commerce/presentation/features/product/product_detail_bloc.dart';
import 'package:e_commerce/presentation/features/product/product_detail_state.dart';
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/config/routes.dart';
import 'package:e_commerce/domain/models/cart_model.dart';
import 'package:e_commerce/presentation/features/home/home_bloc.dart';
import 'package:e_commerce/presentation/features/home/views/home_context.dart';

class ProductDetalScreen extends StatefulWidget {
  final ProductModel productModel;

  ProductDetalScreen({this.productModel});

  @override
  State<StatefulWidget> createState() => _ProductDetalScreenState();
}

class _ProductDetalScreenState extends State<ProductDetalScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
        create: (BuildContext context) => ProductDetailBloc(),
        child: ProductDetailWrapper(
          productModel: this.widget.productModel,
        ));
  }
}

class ProductDetailWrapper extends StatefulWidget {
  final ProductModel productModel;

  ProductDetailWrapper({@required this.productModel});

  @override
  State<StatefulWidget> createState() => _ProductDetailWrapperState();
}

class _ProductDetailWrapperState extends State<ProductDetailWrapper> {
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(HomeContext.context);

    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (BuildContext context, ProductDetailState state) {
        CartModel _cartModel =
            homeBloc.state.cart.search(this.widget.productModel);

        return BlocListener<ProductDetailBloc, ProductDetailState>(
            listener: (BuildContext context, ProductDetailState state) {
              if (state is ProductAddedToWishlistState) {
              } else if (state is ShowDeliveryInfoModalState) {
              } else if (state is OpenCartScreenState) {
                Routes.goToCartScreen(context);
              } else if (state is RefreshedScreenState) {}
            },
            child: ProductDetailView(
              cartModel: _cartModel,
            ));
      },
    );
  }
}

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

class ProductDetalScreen extends StatefulWidget {
  final ProductModel productModel;

  ProductDetalScreen({this.productModel});

  @override
  State<StatefulWidget> createState() => _ProductDetalScreenState();
}

class _ProductDetalScreenState extends State<ProductDetalScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<ProductDetailBloc>(
        create: (BuildContext context) => ProductDetailBloc(),
        child: ProductDetailWrapper(
          productModel: this.widget.productModel,
        ));
  }

  @override
  bool get wantKeepAlive => true;
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
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (BuildContext context, ProductDetailState state) {
        return BlocListener<ProductDetailBloc, ProductDetailState>(
            listener: (BuildContext context, ProductDetailState state) {
              if (state is ProductAddedToWishlistState) {
                print(state.isAddedToWishlist);
              } else if (state is ProductAddedToCartState) {
                print(state.isAddedToCart);
              } else if (state is ShowDeliveryInfoModalState) {
                print('Show Delivery Info Modal State');
              } else if (state is OpenCartScreenState) {
                Routes.goToCartScreen(context);
                print('Open Cart Screen State');
              }
            },
            child: ProductDetailView(
              productModel: this.widget.productModel,
            ));
      },
    );
  }
}

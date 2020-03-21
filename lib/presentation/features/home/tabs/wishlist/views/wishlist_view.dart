// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/widgets/pk_skeleton.dart';
import 'package:e_commerce/presentation/features/home/tabs/wishlist/views/wishlist_list_view.dart';
import 'package:e_commerce/presentation/features/home/tabs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce/presentation/features/home/tabs/wishlist/wishlist_event.dart';
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/presentation/widgets/app_bar_with_hamburger.dart';

class WishlistView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WishlistBloc>(context).add(LoadWishlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products =
        BlocProvider.of<WishlistBloc>(context).state.products;

    return Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBarWithHamburger(
          context: context,
          title: 'My WishList',
          onHamburgerClicked: () {
            print('hamburger clicked');
          },
        ),
        body: products.isEmpty
            ? PKCardListSkeleton(
                isBottomLinesActive: false,
              )
            : WishListListView(
                productModels: products,
                onItemClicked: () => {},
              ));
  }
}

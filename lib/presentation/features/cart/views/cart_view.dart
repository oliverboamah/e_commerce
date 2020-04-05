// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/config/dimen.dart';
import 'package:e_commerce/domain/models/cart_model_list.dart';
import 'package:e_commerce/presentation/widgets/app_bar_with_back_icon.dart';
import 'package:e_commerce/presentation/widgets/cart/cart_list.dart';
import 'package:e_commerce/presentation/features/home/home_bloc.dart';
import 'package:e_commerce/presentation/features/home/views/home_context.dart';
import 'package:e_commerce/domain/models/cart_model.dart';
import 'package:e_commerce/presentation/features/home/home_event.dart';
import 'package:e_commerce/presentation/features/cart/cart_bloc.dart';
import 'package:e_commerce/presentation/features/cart/cart_event.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartModelList cartModelList = CartModelList();
    HomeBloc homeBloc;
    if (HomeContext.context != null) {
      homeBloc = BlocProvider.of<HomeBloc>(HomeContext.context);
      cartModelList = homeBloc.state.cart;
    }

    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBarWithBackIcon(
        context: context,
        title: 'Shopping Cart',
      ),
      body: cartModelList.size() < 1
          ? Center(
              child: Text('No products added'),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: CartList(
                    cartModelList: cartModelList,
                    onItemClicked: (index) => {},
                    onProductChanged: (int index, CartModel cartModel) {
                      homeBloc.add(UpdateProductInCartEvent(
                          index: index, cartModel: cartModel));
                      BlocProvider.of<CartBloc>(context)
                          .add(RefreshCartScreenEvent());
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: defaultWidgetPadding),
                  decoration: BoxDecoration(color: colorWhite, boxShadow: [
                    BoxShadow(
                        color: dividerColor,
                        offset: Offset(0, -0.5),
                        blurRadius: 0.5)
                  ]),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Total',
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                              '\$199',
                              style: Theme.of(context).accentTextTheme.display1,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: primaryColor, width: 2.0)),
                              child: CupertinoButton(
                                padding: EdgeInsets.all(0),
                                minSize: shortButtonSize - 4,
                                child: Text(
                                  'CALL TO ORDER',
                                  style: Theme.of(context).textTheme.display3,
                                ),
                                onPressed: () => {},
                              ),
                            )),
                            Expanded(
                              child: CupertinoButton(
                                minSize: shortButtonSize,
                                padding: EdgeInsets.all(0),
                                color: primaryColor,
                                child: Text(
                                  'COMPLETE YOUR ORDER',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                onPressed: () => {},
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

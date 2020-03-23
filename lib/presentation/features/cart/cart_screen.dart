// flutter imports
import 'package:flutter/material.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/cart/cart_bloc.dart';
import 'package:e_commerce/presentation/features/cart/cart_state.dart';
import 'package:e_commerce/presentation/features/cart/views/cart_view.dart';
import 'package:e_commerce/presentation/features/home/home_bloc.dart';
import 'package:e_commerce/presentation/features/home/home_event.dart';
import 'package:e_commerce/presentation/features/home/views/home_context.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (BuildContext context) => CartBloc(),
      child: CartWrapper(),
    );
  }
}

class CartWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartWrapperState();
}

class _CartWrapperState extends State<CartWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (BuildContext context, CartState state) {
        return BlocListener<CartBloc, CartState>(
          listener: (BuildContext context, CartState state) {
            if (state is CallToOrderState) {
            } else if (state is CompleteOrderState) {
            } else if (state is RemoveProductFromCartState) {
            } else if (state is UpdateProductInCartState) {
              if (HomeContext.context != null) {
                BlocProvider.of<HomeBloc>(HomeContext.context).add(
                    UpdateProductInCartEvent(
                        index: state.index, cartModel: state.cartModel));
              }
            }
          },
          child: CartView(),
        );
      },
    );
  }
}

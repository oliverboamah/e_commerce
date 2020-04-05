// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/home/home_bloc.dart';
import 'package:e_commerce/presentation/features/home/home_state.dart';
import 'package:e_commerce/presentation/features/home/views/home_view.dart';
import 'package:e_commerce/config/routes.dart';
import 'package:e_commerce/presentation/widgets/messages.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
          return BlocListener<HomeBloc, HomeState>(
            listener: (BuildContext context, HomeState state) {
              if (state is OpenCartState) {
                Routes.goToCartScreen(
                  context,
                );
              }
              if (state is ProductAddedToCartState) {
                Messages(
                  message: 'Product added to cart!',
                  messageType: MessageType.success,
                ).show(context);
              } else if (state is ProductSoldOutState) {
                Messages(
                  message: 'Product Sold Out!',
                  messageType: MessageType.error,
                ).show(context);
              }
            },
            child: HomeView(),
          );
        },
      ),
    );
  }
}

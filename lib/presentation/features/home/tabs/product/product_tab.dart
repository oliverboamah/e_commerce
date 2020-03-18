// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/home/tabs/product/product_bloc.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/product_state.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/views/product_view.dart';

class ProductTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (BuildContext context) => ProductBloc(),
      child: ProductWrapper(),
    );
  }
}

class ProductWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductWrapperState();
}

class _ProductWrapperState extends State<ProductWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (BuildContext context, ProductState state) {
        return BlocListener<ProductBloc, ProductState>(
          listener: (BuildContext context, ProductState state) {},
          child: ProductView(),
        );
      },
    );
  }
}

// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/domain/models/product_model.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/product_bloc.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/product_event.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/product_state.dart';
import 'package:e_commerce/presentation/features/home/tabs/product/views/product_list_view.dart';
import 'package:e_commerce/presentation/widgets/pk_skeleton.dart';

class Category1View extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Category1ViewState();
}

class _Category1ViewState extends State<Category1View>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<ProductBloc>(
        create: (BuildContext context) => ProductBloc(),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (BuildContext context, ProductState state) {
            return BlocListener<ProductBloc, ProductState>(
                listener: (BuildContext context, ProductState state) {},
                child: Category1Wrapper());
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

class Category1Wrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Category1WrapperState();
}

class _Category1WrapperState extends State<Category1Wrapper> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context)
        .add(LoadProductsEvent(category: 'category1'));
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products =
        BlocProvider.of<ProductBloc>(context).state.products;

    final int maxLength = 50;
    return products.isEmpty
        ? PKGridCardListSkeleton()
        : ProductListView(
            maxLength: maxLength,
            productModelList: products,
            onItemClicked: () => {},
            onScrollEnd: () {
              if (products.length < maxLength) {
                BlocProvider.of<ProductBloc>(context)
                    .add(LoadProductsEvent(category: 'category1'));
              }
            });
  }
}

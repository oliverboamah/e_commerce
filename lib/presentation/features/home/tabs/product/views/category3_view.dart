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

class Category3View extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Category3ViewState();
}

class _Category3ViewState extends State<Category3View>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<ProductBloc>(
        create: (BuildContext context) => ProductBloc(),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (BuildContext context, ProductState state) {
            return BlocListener<ProductBloc, ProductState>(
                listener: (BuildContext context, ProductState state) {},
                child: Category3Wrapper());
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

class Category3Wrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Category3WrapperState();
}

class _Category3WrapperState extends State<Category3Wrapper> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context)
        .add(LoadProductsEvent(category: 'category3'));
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
                    .add(LoadProductsEvent(category: 'category3'));
              }
            });
  }
}

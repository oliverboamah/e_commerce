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

class Category2View extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Category2ViewState();
}

class _Category2ViewState extends State<Category2View>
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
                child: Category2Wrapper());
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

class Category2Wrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Category2WrapperState();
}

class _Category2WrapperState extends State<Category2Wrapper> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context)
        .add(LoadProductsEvent(category: 'category2'));
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products =
        BlocProvider.of<ProductBloc>(context).state.products;

    return products.isEmpty
        ? PKGridCardListSkeleton()
        : ProductListView(
            productModelList: products,
            onItemClicked: () => {},
          );
  }
}

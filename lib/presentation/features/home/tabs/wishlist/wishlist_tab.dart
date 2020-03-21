// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/home/tabs/wishlist/views/wishlist_view.dart';
import 'package:e_commerce/presentation/features/home/tabs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce/presentation/features/home/tabs/wishlist/wishlist_state.dart';

class WishlistTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WishlistTabState();
}

class _WishlistTabState extends State<WishlistTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider<WishlistBloc>(
        create: (BuildContext context) => WishlistBloc(),
        child: WishlistWrapper());
  }

  @override
  bool get wantKeepAlive => true;
}

class WishlistWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WishlistWrapperState();
}

class _WishlistWrapperState extends State<WishlistWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (BuildContext context, WishlistState state) {
        return BlocListener<WishlistBloc, WishlistState>(
            listener: (BuildContext context, WishlistState state) {},
            child: WishlistView());
      },
    );
  }
}

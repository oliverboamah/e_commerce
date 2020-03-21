// flutter imports
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/presentation/features/home/tabs/product/views/product_view.dart';

class ProductTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  @override
  Widget build(BuildContext context) {
    return ProductView();
  }
}

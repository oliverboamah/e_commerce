// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/ui/models/category_model.dart';

class ProductsTab extends StatefulWidget {
  final CategoryModel categoryModel;

  ProductsTab({this.categoryModel});

  @override
  State<StatefulWidget> createState() => _ProductsTab();
}

class _ProductsTab extends State<ProductsTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(this.widget.categoryModel.name),
    );
  }
}

// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/ui/models/category_model.dart';
import 'package:e_commerce/ui/components/products/product_list.dart';
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/ui/routes/routes.dart';


class ProductsTab extends StatefulWidget {
  final CategoryModel categoryModel;

  ProductsTab({this.categoryModel});

  @override
  State<StatefulWidget> createState() => _ProductsTab();
}

class _ProductsTab extends State<ProductsTab> {
  List<ProductModel> _productModelList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return ProductList(
      productModelList: this._productModelList,
      onItemClicked: (index) => Routes.goToProductDetailPage(context, this._productModelList[index]),
    );
  }

  void loadData() {
    for (int i = 0; i < 60; i++) {
      this._productModelList.add(ProductModel(
          name: 'Lenovo x280',
          price: '\$ 1399',
          discount: '-37%',
          images: ['assets/images/lenovo.jpg']));
    }
  }
}

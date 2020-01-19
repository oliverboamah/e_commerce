// flutter imports
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/ui/models/product_model.dart';
import 'package:e_commerce/ui/components/products/product_item.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel> productModelList;
  final Function onItemClicked;

  ProductList({this.productModelList, this.onItemClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              children: List.generate(this.productModelList.length, (index) {
                return InkWell(
                  child: ProductItem(
                    productModel: this.productModelList[index],
                  ),
                  onTap: () => this.onItemClicked(index),
                );
              }),
            );
          },
        ));
  }
}

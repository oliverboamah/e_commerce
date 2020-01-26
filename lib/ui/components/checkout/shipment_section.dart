// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/secondary_section_header.dart';
import 'package:e_commerce/ui/models/cart_model_list.dart';
import 'package:e_commerce/ui/components/checkout/package_item.dart';

class ShipmentSection extends StatelessWidget {
  final CartModelList cartModelList;

  ShipmentSection({@required this.cartModelList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SecondarySectionHeader(
          title: 'Shipment Details',
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: 24.0, left: 24.0, top: 4.0, bottom: 16.0),
          child: Container(
            height: 300,
            padding: EdgeInsets.only(bottom: 8.0),
            child: ListView.builder(
                padding: EdgeInsets.only(top: 0),
                itemCount: this.cartModelList.size(),
                itemBuilder: (context, index) {
                  return PackageItem(
                      index: index,
                      numItems: this.cartModelList.size(),
                      cartModel: this.cartModelList.get(index));
                }),
          ),
        )
      ],
    );
  }
}

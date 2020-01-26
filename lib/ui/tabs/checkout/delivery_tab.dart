// flutter import
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/ui/components/checkout/address_section.dart';
import 'package:e_commerce/ui/components/checkout/delivery_method_section.dart';
import 'package:e_commerce/ui/components/checkout/shipment_section.dart';
import 'package:e_commerce/ui/models/cart_model_list.dart';

class DeliveryTab extends StatefulWidget {
  final CartModelList cartModelList;

  DeliveryTab({this.cartModelList});

  @override
  State<StatefulWidget> createState() => _DeliveryTabState();
}

class _DeliveryTabState extends State<DeliveryTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 8.0),
      children: <Widget>[
        AddressSection(),
        DeliveryMethodSection(),
        ShipmentSection(
          cartModelList: this.widget.cartModelList,
        )
      ],
    );
  }
}

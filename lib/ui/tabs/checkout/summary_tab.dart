// flutter imports
import 'package:flutter/cupertino.dart';

// my app imports
import 'package:e_commerce/ui/models/cart_model_list.dart';
import 'package:e_commerce/ui/components/checkout/address_section.dart';
import 'package:e_commerce/ui/components/checkout/delivery_method_section.dart';
import 'package:e_commerce/ui/components/checkout/shipment_section.dart';
import 'package:e_commerce/ui/components/checkout/order_total_section.dart';

class SummaryTab extends StatefulWidget {
  final CartModelList cartModelList;

  SummaryTab({this.cartModelList});

  @override
  State<StatefulWidget> createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 8.0),
      children: <Widget>[
        OrderTotalSection(),
        AddressSection(
          leadingTitle: 'Your Address',
          address:
              'Oliver Boamah\nHouse 14, American House\nEast Legon\n+233 55 329 5012',
          trailingTitle: 'Change',
        ),
        DeliveryMethodSection(),
        ShipmentSection(
          cartModelList: this.widget.cartModelList,
        )
      ],
    );
  }
}

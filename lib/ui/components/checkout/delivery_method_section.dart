// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/secondary_section_header.dart';
import 'package:e_commerce/values/colors.dart';

class DeliveryMethodSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DeliveryMethodSectionState();
}

class _DeliveryMethodSectionState extends State<DeliveryMethodSection> {
  final String address =
      'Oliver Boamah\nHouse 14, American House\nEast Legon\n+233 55 329 5012';

  final String deliveryMethod1 =
      'Home & Office Delivery\nDelivered between Friday Jan 3 and\nTuesday 7 Jan';

  final String deliveryMethod2 =
      'at any of our Pickup Stations\nAvailable between Friday Jan 3 and\nTuesday 7 Jan';

  final double shippingFee = 2;

  int radioGroupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SecondarySectionHeader(
          title: 'Select Delivery Method',
        ),
        Padding(
            padding: const EdgeInsets.only(
                right: 24.0, left: 24.0, top: 8.0, bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 0,
                  onChanged: (value) =>
                      this.setState(() => this.radioGroupValue = 0),
                  groupValue: this.radioGroupValue,
                  activeColor: primaryColor,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.deliveryMethod1,
                        style: Theme.of(context).textTheme.body1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Row(children: [
                          Text(
                            'Shipping Fee:  ',
                            style: Theme.of(context).textTheme.display1,
                          ),
                          Text(
                            '\$${this.shippingFee}',
                            style: Theme.of(context).textTheme.body1,
                          )
                        ]),
                      )
                    ],
                  ),
                )
              ],
            )),
        Padding(
            padding:
                const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 1,
                  onChanged: (value) =>
                      this.setState(() => this.radioGroupValue = 1),
                  groupValue: this.radioGroupValue,
                  activeColor: primaryColor,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.deliveryMethod2,
                        style: Theme.of(context).textTheme.body1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text(
                          'SELECT A PICKUP STATION',
                          style: Theme.of(context).accentTextTheme.body1,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}

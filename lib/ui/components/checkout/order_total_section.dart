// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/secondary_section_header.dart';
import 'package:e_commerce/ui/components/horizontal_line.dart';

class OrderTotalSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SecondarySectionHeader(
          title: 'Your Order',
        ),
        Padding(
            padding: const EdgeInsets.only(
                right: 24.0, left: 24.0, top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'SubTotal',
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  '\$199',
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            )),
        Padding(
            padding:
                const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Shipping',
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(
                  '\$0',
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: HorizontalLine(
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
                right: 24.0, left: 24.0, top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: Theme.of(context).accentTextTheme.subhead,
                ),
                Text(
                  '\$199',
                  style: Theme.of(context).accentTextTheme.subhead,
                ),
              ],
            )),
      ],
    );
  }
}

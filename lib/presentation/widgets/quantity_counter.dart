// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';

class QuantityCounter extends StatefulWidget {
  final int quantity;
  final Function onQuantityChanged;
  QuantityCounter({@required this.quantity, @required this.onQuantityChanged});

  @override
  State<StatefulWidget> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int _quantity;

  @override
  Widget build(BuildContext context) {
    _quantity = this.widget.quantity;

    return Row(
      children: <Widget>[
        InkWell(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: primaryHighlightColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Icon(
                Icons.add,
                color: primaryColor,
              )),
          onTap: () {
            this.widget.onQuantityChanged(this._quantity + 1);
            this.setState(() => this._quantity = this._quantity + 1);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '${this._quantity}',
            style: Theme.of(context).accentTextTheme.display1,
          ),
        ),
        InkWell(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: primaryHighlightColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Icon(
                Icons.remove,
                color: primaryColor,
              )),
          onTap: () {
            if (this._quantity > 1) {
              this.widget.onQuantityChanged(this._quantity - 1);
              this.setState(() => this._quantity = this._quantity - 1);
            }
          },
        )
      ],
    );
  }
}

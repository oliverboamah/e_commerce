// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';

class PaymentFailurePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentFailurePageState();
}

class _PaymentFailurePageState extends State<PaymentFailurePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 60),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                'Payment Failed',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: primaryHighlightColor),
              child: Icon(
                Icons.close,
                size: 40,
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
              child: Text(
                '      Payment failed due to\ninsufficient account balance',
                style: Theme.of(context).accentTextTheme.display1,
              ),
            ),
            CupertinoButton(
              child: Text('TRY AGAIN'),
              color: primaryColor,
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}

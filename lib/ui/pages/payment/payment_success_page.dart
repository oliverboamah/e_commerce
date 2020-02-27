// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';

class PaymentSuccessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentSuccessPageState();

}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 60, 
      left: 24.0, right: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
          children: <Widget>[
                  Text('Order Placed', style: Theme.of(context).textTheme.headline,),
                  Container(
                    margin: EdgeInsets.only(top: 32, bottom: 32),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: primaryHighlightColor),
                  child: Icon(
                    Icons.check,
                    size: 40,
                    color: primaryColor,
                  ),
                ),
                Text('Mr. Oliver,', style: Theme.of(context).accentTextTheme.display1),
                Text('Thank you for your purchase', style: Theme.of(context).accentTextTheme.display1),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                  child: Image.asset('assets/images/party.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Date', style: Theme.of(context).textTheme.title,),
                    Text('11-12-2019', style: Theme.of(context).textTheme.title,)
                  ],
                ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 16.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Order No', style: Theme.of(context).textTheme.title,),
                      Text('300012212', style: Theme.of(context).textTheme.title,)
                    ],
                ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 24.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Total Price', style: Theme.of(context).textTheme.title,),
                      Text('\$199', style: Theme.of(context).accentTextTheme.display1,)
                    ],
                ),
                 ),
                CupertinoButton(
                  child: Text('Back to Home'),
                  color: primaryColor,
                  onPressed: () => {},
                )
                ],
        ),
    );
  }

}
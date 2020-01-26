// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/checkout/checkout_app_bar.dart';
import 'package:e_commerce/ui/tabs/checkout/delivery_tab.dart';
import 'package:e_commerce/ui/tabs/checkout/payment_tab.dart';
import 'package:e_commerce/ui/tabs/checkout/summary_tab.dart';
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/values/dimen.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _selectedIndex = 0;
  List<Widget> tabs = [DeliveryTab(), SummaryTab(), PaymentTab()];
  final List<String> tabButtonTitle = [
    'PROCEED TO SUMMARY',
    'PROCEED TO PAYMENT',
    ''
  ];
  final PageController _pageController = PageController();

  _onTabSelected(int index) {
    this.setState(() => this._selectedIndex = index);
    this._pageController.jumpToPage(index);
  }

  _next() {
    if (this._selectedIndex == 0) {
      this.setState(() => this._selectedIndex = 1);
      this._pageController.jumpToPage(1);
    } else if (this._selectedIndex == 1) {
      this.setState(() => this._selectedIndex = 2);
      this._pageController.jumpToPage(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorWhite,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: <Widget>[
            CheckoutAppBar(
              selectedIndex: this._selectedIndex,
              onTabSelected: this._onTabSelected,
            ),
            Expanded(
              child: PageView(
                controller: this._pageController,
                children: this.tabs,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: defaultWidgetPadding),
                decoration: BoxDecoration(color: colorWhite, boxShadow: [
                  BoxShadow(
                      color: dividerColor,
                      offset: Offset(0, -0.5),
                      blurRadius: 0.5)
                ]),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: CupertinoButton(
                      minSize: buttonSize,
                      color: primaryColor,
                      child: Text(
                        this.tabButtonTitle[this._selectedIndex],
                        style: Theme.of(context).accentTextTheme.display2,
                      ),
                      onPressed: () => this._next(),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

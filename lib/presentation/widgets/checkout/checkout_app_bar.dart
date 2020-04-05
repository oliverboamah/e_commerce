// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/presentation/widgets/checkout/checkout_tab_item.dart';

class CheckoutAppBar extends StatefulWidget {
  final int selectedIndex;
  final Function onTabSelected;

  CheckoutAppBar({this.selectedIndex = 0, @required this.onTabSelected});

  @override
  State<StatefulWidget> createState() => _CheckoutAppBarState();
}

class _CheckoutAppBarState extends State<CheckoutAppBar> {
  int _selectedTabIndex;

  _onTabSelected(int index) {
    this.setState(() => this._selectedTabIndex = index);
    this.widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    this._selectedTabIndex = this.widget.selectedIndex;

    return Container(
      padding: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(color: colorWhite, boxShadow: [
        BoxShadow(color: dividerColor, offset: Offset(0, 0.5), blurRadius: 0.5)
      ]),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Text(
                  'Checkout',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Text('')
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: CheckoutTabItem(
                    title: 'Delivery',
                    backgroundColor: this._selectedTabIndex == 0
                        ? primaryHighlightColor
                        : colorWhite,
                    titleColor: this._selectedTabIndex == 0
                        ? Theme.of(context).accentTextTheme.body1
                        : Theme.of(context).textTheme.title,
                  ),
                  onTap: () => this._onTabSelected(0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: InkWell(
                    child: CheckoutTabItem(
                      title: 'Summary',
                      backgroundColor: this._selectedTabIndex == 1
                          ? primaryHighlightColor
                          : colorWhite,
                      titleColor: this._selectedTabIndex == 1
                          ? Theme.of(context).accentTextTheme.body1
                          : Theme.of(context).textTheme.title,
                    ),
                    onTap: () => this._onTabSelected(1),
                  ),
                ),
                InkWell(
                  child: CheckoutTabItem(
                    title: 'Payment',
                    backgroundColor: this._selectedTabIndex == 2
                        ? primaryHighlightColor
                        : colorWhite,
                    titleColor: this._selectedTabIndex == 2
                        ? Theme.of(context).accentTextTheme.body1
                        : Theme.of(context).textTheme.title,
                  ),
                  onTap: () => this._onTabSelected(2),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

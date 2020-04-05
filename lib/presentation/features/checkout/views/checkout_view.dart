// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/domain/models/cart_model_list.dart';
import 'package:e_commerce/presentation/features/checkout/checkout_bloc.dart';
import 'package:e_commerce/presentation/features/checkout/checkout_event.dart';
import 'package:e_commerce/presentation/features/checkout/tabs/delivery_tab.dart';
import 'package:e_commerce/presentation/features/checkout/tabs/payment_tab.dart';
import 'package:e_commerce/presentation/features/checkout/tabs/summary_tab.dart';
import 'package:e_commerce/presentation/widgets/checkout/checkout_app_bar.dart';
import 'package:e_commerce/config/dimen.dart';
import 'package:e_commerce/presentation/features/checkout/checkout_state.dart';

class CheckoutView extends StatefulWidget {
  final CartModelList cartModelList;

  CheckoutView({@required this.cartModelList});

  @override
  State<StatefulWidget> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  final PageController _pageController = PageController();
  final List<String> tabButtonTitle = [
    'PROCEED TO SUMMARY',
    'PROCEED TO PAYMENT',
    ''
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CheckoutBloc>(context).add(LoadShippingAddressEvent());
  }

  @override
  Widget build(BuildContext context) {
    final CheckoutBloc checkoutBloc = BlocProvider.of<CheckoutBloc>(context);

    if (checkoutBloc.state is TabSelectedState) {
      this._pageController.jumpToPage(checkoutBloc.state.selectedTabIndex);
    }
    return Scaffold(
      body: Container(
        color: colorWhite,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: <Widget>[
            CheckoutAppBar(
              selectedIndex: checkoutBloc.state.selectedTabIndex,
              onTabSelected: (index) => BlocProvider.of<CheckoutBloc>(context)
                  .add(TabSelectedEvent(tabSelectedIndex: index)),
            ),
            Expanded(
              child: PageView(
                controller: this._pageController,
                children: [
                  DeliveryTab(
                    cartModelList: this.widget.cartModelList,
                    shippingAddressModel: checkoutBloc.state.shippingAddress,
                  ),
                  SummaryTab(
                    cartModelList: this.widget.cartModelList,
                  ),
                  PaymentTab()
                ],
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
                        this.tabButtonTitle[
                            checkoutBloc.state.selectedTabIndex],
                        style: Theme.of(context).accentTextTheme.display2,
                      ),
                      onPressed: () {
                        if (checkoutBloc.state.selectedTabIndex == 0) {
                          this._pageController.jumpToPage(1);
                        } else {
                          this._pageController.jumpToPage(2);
                        }
                      },
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

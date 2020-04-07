// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/checkout/checkout_bloc.dart';
import 'package:e_commerce/presentation/features/checkout/checkout_state.dart';
import 'package:e_commerce/presentation/features/checkout/views/checkout_view.dart';
import 'package:e_commerce/presentation/features/home/home_bloc.dart';
import 'package:e_commerce/presentation/features/home/views/home_context.dart';
import 'package:e_commerce/config/routes.dart';
import 'package:e_commerce/domain/models/shipping_address_model.dart';
import 'package:e_commerce/presentation/features/checkout/checkout_event.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckoutBloc>(
      create: (BuildContext context) => CheckoutBloc(),
      child: BlocListener<CheckoutBloc, CheckoutState>(
        listener: (BuildContext context, CheckoutState state) {
          if (state is OpenAddressScreenState) {
            Routes.goToAddressScreenForResult(context, state.title)
                .then((ShippingAddressModel shippingAddressModel) {
              if (shippingAddressModel != null) {
                BlocProvider.of<CheckoutBloc>(context).add(
                    UpdateShippingAddressEvent(
                        shippingAddressModel: shippingAddressModel));
              }
            });
          }
        },
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (BuildContext context, CheckoutState state) {
            return CheckoutView(
              cartModelList:
                  BlocProvider.of<HomeBloc>(HomeContext.context).state.cart,
            );
          },
        ),
      ),
    );
  }
}

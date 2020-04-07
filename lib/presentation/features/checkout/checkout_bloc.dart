// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/checkout/checkout_event.dart';
import 'package:e_commerce/presentation/features/checkout/checkout_state.dart';
import 'package:e_commerce/data/factories/shipping_address/shipping_address_factory.dart';
import 'package:e_commerce/domain/models/shipping_address_model.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final ShippingAddressRepositoryFactory shippingAddressRepositoryFactory =
      ShippingAddressRepositoryFactory();
  @override
  CheckoutState get initialState => CheckoutInitialState(selectedTabIndex: 0);

  @override
  Stream<CheckoutState> mapEventToState(CheckoutEvent event) async* {
    if (event is LoadShippingAddressEvent) {
      ShippingAddressModel shippingAddressModel =
          await shippingAddressRepositoryFactory.getAddress();
      yield ShippingAddressLoadedState(
          selectedTabIndex: state.selectedTabIndex,
          shippingAddress: shippingAddressModel);
    } else if (event is TabSelectedEvent) {
      yield TabSelectedState(
          selectedTabIndex: event.tabSelectedIndex,
          shippingAddress: state.shippingAddress);
    } else if (event is OpenAddressScreenEvent) {
      yield OpenAddressScreenState(
          selectedTabIndex: state.selectedTabIndex,
          shippingAddress: state.shippingAddress,
          title: event.title,
          uId: DateTime.now().toIso8601String());
    } else if (event is UpdateShippingAddressEvent) {
      yield ShippingAddressUpdatedState(
          selectedTabIndex: state.selectedTabIndex,
          shippingAddress: event.shippingAddressModel,
          uId: DateTime.now().toIso8601String());
    }
  }
}

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/checkout/checkout_event.dart';
import 'package:e_commerce/presentation/features/checkout/checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  @override
  CheckoutState get initialState => CheckoutInitialState(selectedTabIndex: 0);

  @override
  Stream<CheckoutState> mapEventToState(CheckoutEvent event) async* {
    if (event is TabSelectedEvent) {
      yield TabSelectedState(selectedTabIndex: event.tabSelectedIndex);
    }
  }
}

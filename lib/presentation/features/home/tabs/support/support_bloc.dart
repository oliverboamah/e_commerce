// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/home/tabs/support/support_event.dart';
import 'package:e_commerce/presentation/features/home/tabs/support/support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  @override
  SupportState get initialState => SupportInitialState();

  @override
  Stream<SupportState> mapEventToState(SupportEvent event) async* {}
}

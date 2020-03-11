import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/presentation/features/account/register/register_event.dart';
import 'package:e_commerce/presentation/features/account/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  @override
  RegisterState get initialState => RegisterInitialState(agreeToTerms: false);

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    try {
      if (event is AgreeToTermsEvent) {
        yield AgreeToTermsState(agreeToTerms: event.agreeToTerms);
      } else if (event is CreateUserEvent) {
        yield RegisterSuccessState(agreeToTerms: state.agreeToTerms);
      }
    } catch (error) {
      yield RegisterErrorState(
          agreeToTerms: state.agreeToTerms, errorMessage: error.toString());
    }
  }
}

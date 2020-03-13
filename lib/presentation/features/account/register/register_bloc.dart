import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/presentation/features/account/register/register_event.dart';
import 'package:e_commerce/presentation/features/account/register/register_state.dart';
import 'package:e_commerce/domain/repositories/user_auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserAuthRepository userAuthRepository;

  RegisterBloc({@required this.userAuthRepository});
  @override
  RegisterState get initialState => RegisterInitialState(agreeToTerms: false);

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    try {
      if (event is AgreeToTermsEvent) {
        yield AgreeToTermsState(agreeToTerms: event.agreeToTerms);
      } else if (event is CreateUserEvent) {
        await userAuthRepository.signUp(
            event.registerModel.email,
            event.registerModel.password,
            event.registerModel.firstName,
            event.registerModel.lastName);
        yield RegisterSuccessState(agreeToTerms: state.agreeToTerms);
      }
    } catch (error) {
      print(error);
      yield RegisterErrorState(
          agreeToTerms: state.agreeToTerms, errorMessage: error.toString());
    }
  }
}

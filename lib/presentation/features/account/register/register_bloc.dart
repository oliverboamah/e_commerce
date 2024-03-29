// flutter imports
import 'package:flutter/services.dart';

// third party imports
import 'package:flutter_bloc/flutter_bloc.dart';

// my app imports
import 'package:e_commerce/presentation/features/account/register/register_event.dart';
import 'package:e_commerce/presentation/features/account/register/register_state.dart';
import 'package:e_commerce/data/remote/auth/firebase_user_auth_repository.dart';
import 'package:e_commerce/domain/repositories/primary_user_auth_repository.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  PrimaryUserAuthRepository primaryUserAuthRepository;

  @override
  RegisterState get initialState => RegisterInitialState(agreeToTerms: false);

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is AgreeToTermsEvent) {
      yield AgreeToTermsState(agreeToTerms: event.agreeToTerms);
    } else if (event is CreateFirebaseUserEvent) {
      primaryUserAuthRepository = FirebaseUserAuthRepository();
      try {
        await primaryUserAuthRepository.signUp(
            event.registerModel.email,
            event.registerModel.password,
            event.registerModel.firstName,
            event.registerModel.lastName);
        event.stopLoading();
        yield RegisterSuccessState(agreeToTerms: state.agreeToTerms);
      } catch (error) {
        String errorMessage = '';
        switch ((error as PlatformException).code) {
          case 'ERROR_WEAK_PASSWORD':
            errorMessage = 'Password should be at least 6 characters';
            break;
          case 'ERROR_EMAIL_ALREADY_IN_USE':
            errorMessage =
                'The email address is already in use by another account';
            break;
          default:
        }
        event.stopLoading();
        yield RegisterErrorState(
            errorHashCode: error.hashCode,
            agreeToTerms: state.agreeToTerms,
            errorMessage: errorMessage);
      }
    }
  }
}

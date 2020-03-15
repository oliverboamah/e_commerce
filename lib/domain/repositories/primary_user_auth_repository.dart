import 'package:flutter/widgets.dart';
import 'package:e_commerce/domain/repositories/user_auth_repository.dart';

@immutable
abstract class PrimaryUserAuthRepository extends UserAuthRepository {
  Future<String> signIn({String email, String password});

  Future<String> signUp(
      String email, String password, String firstName, String lastName);
}

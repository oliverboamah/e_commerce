import 'package:flutter/widgets.dart';
import 'package:e_commerce/domain/repositories/user_auth_repository.dart';

@immutable
abstract class SecondaryUserAuthRepository extends UserAuthRepository {
  Future<String> signIn();
}

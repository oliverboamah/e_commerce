import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class UserAuthRepository extends Equatable {
  @override
  List<Object> get props => [];

  Future<String> signIn({String email, String password});

  Future<String> signUp(
      String email, String password, String firstName, String lastName);
}

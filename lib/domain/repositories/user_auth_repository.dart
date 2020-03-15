import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class UserAuthRepository extends Equatable {
  @override
  List<Object> get props => [];
  Future<void> signOut();
}

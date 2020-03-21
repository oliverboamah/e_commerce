// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class SupportState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class SupportInitialState extends SupportState {}

// flutter imports
import 'package:flutter/widgets.dart';

// third party imports
import 'package:equatable/equatable.dart';

@immutable
abstract class WishlistEvent extends Equatable {}

@immutable
class LoadWishlistEvent extends WishlistEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Load Wishlist Event';
}

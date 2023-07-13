import 'package:cart_mangement_bloc/models/product.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final Product product;

  AddToCartEvent({required this.product});

  @override
  // TODO: implement props
  List<Object> get props => [product];
}

class RemoveFromCartEvent extends CartEvent {
  final Product product;

  RemoveFromCartEvent({required this.product});

  @override
  // TODO: implement props
  List<Object> get props => [product];
}

class ClearCartEvent extends CartEvent{}

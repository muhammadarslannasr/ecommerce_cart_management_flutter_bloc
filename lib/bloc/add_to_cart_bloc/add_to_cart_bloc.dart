import 'dart:async';

import 'package:cart_mangement_bloc/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:cart_mangement_bloc/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:cart_mangement_bloc/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(cartItems: [])) {
    on<CartEvent>(_cartEvent);
  }

  FutureOr<void> _cartEvent(CartEvent event, Emitter<CartState> emit) async {
    if (event is AddToCartEvent) {
      final updatedCart = List<Product>.from(state.cartItems)
        ..add(event.product);
      emit(CartState(cartItems: updatedCart));
    } else if (event is RemoveFromCartEvent) {
      final updatedCart = List<Product>.from(state.cartItems)
        ..remove(event.product);
      emit(CartState(cartItems: updatedCart));
    } else if(event is ClearCartEvent){
      //clear state cart Item.
      if(state.cartItems.isNotEmpty){
        state.cartItems.clear();
        emit(CartState(cartItems: []));
      }
    }
  }
}

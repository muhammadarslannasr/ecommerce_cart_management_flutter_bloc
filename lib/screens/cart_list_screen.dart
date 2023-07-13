import 'package:cart_mangement_bloc/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:cart_mangement_bloc/bloc/add_to_cart_bloc/add_to_cart_event.dart';
import 'package:cart_mangement_bloc/bloc/add_to_cart_bloc/add_to_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          } else {
            return ListView.builder(
              itemCount: state.cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final product = state.cartItems[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    onPressed: () {
                      final cartBloc = BlocProvider.of<CartBloc>(context);
                      cartBloc.add(RemoveFromCartEvent(product: product));
                    },
                    icon: const Icon(Icons.remove_shopping_cart_outlined),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final cartBloc = BlocProvider.of<CartBloc>(context);
          cartBloc.add(ClearCartEvent());
        },
        child: const Icon(
          Icons.check_outlined,
        ),
      ),
    );
  }
}

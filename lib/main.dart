import 'package:cart_mangement_bloc/bloc/add_to_cart_bloc/add_to_cart_bloc.dart';
import 'package:cart_mangement_bloc/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        title: 'Ecommerce App',
        initialRoute: '/',
        routes: {'/': (context) => const ProductListScreen()},
      ),
    );
  }
}

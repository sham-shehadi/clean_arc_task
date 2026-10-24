import 'package:flutter/material.dart';
import 'core/di/injection.dart';
import 'features/product/presentation/widgets/product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/product/presentation/cubit/products_cubit.dart';
void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => getIt<ProductsCubit>()..loadProducts(),
        child: const ProductsScreen(),
      ),
    );
  }
}

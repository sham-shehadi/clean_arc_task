import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import 'product_card.dart';
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producs..'),
        centerTitle: true,
        backgroundColor: Color(0xFF9F6CCB),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return  Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductsError) {
            return Center(child: Text(state.message),
            );
          }

          if (state is ProductsSuccess) {
            return GridView.builder(
              padding:  EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                mainAxisExtent: 340,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: state.products[index],
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
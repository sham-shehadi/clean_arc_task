import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product,});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:  Color(0xFFFFFBF7),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return  Icon(Icons.broken_image_outlined);
                  },
                ),
              ),
            ), SizedBox(height: 8),
            Text(
              product.title,
              maxLines: 2, overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              '${product.price.toStringAsFixed(2)} \$',
              style:  TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF6B9080),
              ),
            ),
            SizedBox(height: 4),
            Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          product['image_front_url'],
          width: 200,
          height: 200,
          errorBuilder: (context, error, stackTrace) =>
              const Text('No image available'),
        ),
        const SizedBox(height: 10),
        Text(
          product['product_name'],
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          product['quantity'],
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

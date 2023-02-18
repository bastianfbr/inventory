import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/services/products_notifier.dart';
import 'package:inventory/views/product_view.dart';
import 'package:inventory/models/product.dart';

final productsProvider = StateNotifierProvider<ProductsNotifier, List<Product>>(
    (ref) => ProductsNotifier());

class BarcodeScannerPage extends HookConsumerWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (products.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductView(product: product);
                },
              ),
            )
          else
            const Text('No products scanned yet'),
        ],
      ),
    );
  }
}

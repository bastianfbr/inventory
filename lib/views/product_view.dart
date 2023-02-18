import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/models/product.dart';

class ProductView extends HookConsumerWidget {
  const ProductView({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(product.image as String),
            ),
            title: Text("${product.brand} ${product.name}"),
            subtitle: Text("Quantité : ${product.quantity}"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductView extends HookConsumerWidget {
  const ProductView({required this.product, Key? key}) : super(key: key);

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(product['image_front_url']),
            ),
            title: Text("${product['brands']} ${product['product_name']}"),
            subtitle: Text("Quantité : ${product['quantity']}"),
          ),
        ],
      ),
    );
  }
}

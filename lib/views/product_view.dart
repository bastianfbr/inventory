import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/models/product.dart';
import 'package:inventory/pages/barcode_scanner_page.dart';

class ProductView extends HookConsumerWidget {
  const ProductView({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsNotifier = ref.watch(productsProvider.notifier);

    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: 350,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(product.image as String),
                  ),
                  title: Text("${product.brand} ${product.name}"),
                  subtitle: Text("Quantité : ${product.quantity}"),
                ),
              ),
              IconButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    final nameController =
                        TextEditingController(text: product.name);
                    final brandController =
                        TextEditingController(text: product.brand);
                    final imageController =
                        TextEditingController(text: product.image);
                    final quantityController =
                        TextEditingController(text: product.quantity);

                    return AlertDialog(
                      title: const Text('Modifier le produit'),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: 'Nom',
                              ),
                            ),
                            TextField(
                              controller: brandController,
                              decoration: const InputDecoration(
                                labelText: 'Marque',
                              ),
                            ),
                            TextField(
                              controller: quantityController,
                              decoration: const InputDecoration(
                                labelText: 'Quantité',
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            productsNotifier.deleteProduct(product.id);
                            Navigator.pop(context);
                          },
                          child: const Text('Supprimer'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // ignore: unused_local_variable
                            final updatedProduct = Product(
                              name: nameController.text,
                              brand: brandController.text,
                              image: imageController.text,
                              quantity: quantityController.text,
                            );
                            productsNotifier.editProduct(
                                product.id, updatedProduct);
                            Navigator.pop(context);
                          },
                          child: const Text('Modifier'),
                        ),
                      ],
                    );
                  },
                ),
                icon: const Icon(Icons.edit_outlined),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/pages/barcode_scanner_page.dart';
import 'package:inventory/services/barcode_scanner_provider.dart';
import 'package:inventory/services/open_food_services.dart';

class AppMenu extends HookConsumerWidget {
  const AppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openFoodServices = OpenFoodServices();
    final productsNotifier = ref.watch(productsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Inventory App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 20,
      ),
      body: const BarcodeScannerPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final scanner = ref.read(barcodeScannerProvider);
          final code = await scanner.scanBarcode();

          var fetchedProduct = await openFoodServices.getProduct(code);
          if (fetchedProduct != null) {
            productsNotifier.addProduct(fetchedProduct);
          }
        },
        tooltip: 'Scan Barcode',
        child: const Icon(
          Icons.barcode_reader,
          size: 30,
        ),
      ),
    );
  }
}

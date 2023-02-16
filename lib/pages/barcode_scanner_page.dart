import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/services/barcode_scanner_provider.dart';
import 'package:inventory/services/open_food_services.dart';
import 'package:inventory/views/product_view.dart';

class BarcodeScannerPage extends ConsumerStatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BarcodeScannerPage> createState() => BarcodeScannerPageState();
}

class BarcodeScannerPageState extends ConsumerState<BarcodeScannerPage> {
  String barcode = '';
  Map<String, dynamic> product = {};
  final openFoodServices = OpenFoodServices();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Scan a barcode to get product information',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              final scanner = ref.read(barcodeScannerProvider);
              final code = await scanner.scanBarcode();
              setState(() {
                barcode = code;
              });

              var fetchedProduct = await openFoodServices.getProduct(barcode);
              if (fetchedProduct != null) {
                setState(() {
                  product = fetchedProduct;
                });
              }
            },
            child: const Text('Scan Barcode'),
          ),
          const SizedBox(height: 30),
          product.isNotEmpty ? ProductView(product: product) : Container(),
        ],
      ),
    );
  }
}

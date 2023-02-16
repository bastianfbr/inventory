import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:inventory/services/open_food_services.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  BarcodeScannerPageState createState() => BarcodeScannerPageState();
}

class BarcodeScannerPageState extends State<BarcodeScannerPage> {
  String barcode = '';
  Map<String, dynamic> product = {};
  OpenFoodServices openFoodServices = OpenFoodServices();

  Future<void> scanBarcode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.BARCODE,
    );
    setState(() {
      barcode = code;
    });

    var fetchedProduct = await openFoodServices.getProduct(barcode);
    if (fetchedProduct != null) {
      setState(() {
        product = fetchedProduct;
      });
    }
  }

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
            onPressed: scanBarcode,
            child: const Text('Scan Barcode'),
          ),
          const SizedBox(height: 30),
          product.isNotEmpty
              ? Column(
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
                )
              : Container(),
        ],
      ),
    );
  }
}

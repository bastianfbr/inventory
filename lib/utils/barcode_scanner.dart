import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner {
  static Future<String> scanBarcode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.BARCODE,
    );
    return code;
  }
}

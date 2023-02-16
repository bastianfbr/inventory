import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final barcodeScannerProvider = Provider<BarcodeScanner>((ref) {
  return BarcodeScanner();
});

class BarcodeScanner {
  Future<String> scanBarcode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.BARCODE,
    );
    return code;
  }
}

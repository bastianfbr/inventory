import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/views/product_view.dart';

class BarcodeScannerPage extends ConsumerStatefulWidget {
  final Map<String, dynamic> product;

  const BarcodeScannerPage(this.product, {Key? key}) : super(key: key);

  @override
  ConsumerState<BarcodeScannerPage> createState() => BarcodeScannerPageState();
}

class BarcodeScannerPageState extends ConsumerState<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.product.isNotEmpty
              ? ProductView(product: widget.product)
              : Container(),
        ],
      ),
    );
  }
}

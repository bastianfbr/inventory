import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/pages/barcode_scanner_page.dart';
import 'package:inventory/services/barcode_scanner_provider.dart';
import 'package:inventory/services/open_food_services.dart';

class AppMenu extends ConsumerStatefulWidget {
  const AppMenu({super.key});

  @override
  ConsumerState<AppMenu> createState() => AppMenuState();
}

class AppMenuState extends ConsumerState<AppMenu> {
  String barcode = '';
  Map<String, dynamic> product = {};
  final openFoodServices = OpenFoodServices();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Barcode Scanner',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 20,
        centerTitle: mounted,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.inventory_rounded),
            icon: Icon(Icons.inventory_outlined),
            label: 'Inventory',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings_rounded),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          )
        ],
      ),
      body: <Widget>[
        const BarcodeScannerPage(),
        Container(),
      ][currentPageIndex],
      floatingActionButton: currentPageIndex == 0
          ? FloatingActionButton(
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
              tooltip: 'Scan Barcode',
              child: const Icon(
                Icons.barcode_reader,
                size: 30,
              ),
            )
          : Container(),
    );
  }
}

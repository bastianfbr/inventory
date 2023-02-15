import 'package:flutter/material.dart';

import 'package:inventory/barcode_scanner_page.dart';

class AppMenu extends StatefulWidget {
  const AppMenu({super.key});

  @override
  AppMenuState createState() => AppMenuState();
}

class AppMenuState extends State<AppMenu> {
  String barcode = '';
  Map<String, dynamic> product = {};

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
              onPressed: () => showDialog(
                  context: context, builder: ((context) => Container())),
              tooltip: 'Add Item',
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            )
          : Container(),
    );
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  ProductsNotifier() : super([]);

  void addProduct(Map<String, dynamic> product) {
    state = [...state, product];
  }
}

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/models/product.dart';

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }
}

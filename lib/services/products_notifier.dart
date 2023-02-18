import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inventory/models/product.dart';

final productsProvider =
    StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  return ProductsNotifier();
});

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void editProduct(String productId, Product updatedProduct) {
    final index = state.indexWhere((product) => product.id == productId);
    if (index != -1) {
      state = [
        ...state.sublist(0, index),
        updatedProduct,
        ...state.sublist(index + 1),
      ];
    }
  }

  void deleteProduct(String productId) {
    state = state.where((product) => product.id != productId).toList();
  }
}

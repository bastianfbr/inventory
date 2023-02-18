import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventory/models/product.dart';

class OpenFoodServices {
  Future<Product?> getProduct(String id) async {
    var client = http.Client();

    var uri =
        Uri.parse('https://world.openfoodfacts.org/api/v0/product/$id.json');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var product = jsonDecode(response.body)['product'];
      return Product(
          name: product['product_name'],
          brand: product['brands'],
          image: product['image_front_url'],
          quantity: product['quantity']);
    }
    return null;
  }
}

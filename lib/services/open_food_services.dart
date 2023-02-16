import 'dart:convert';

import 'package:http/http.dart' as http;

class OpenFoodServices {
  Future<Map<String, dynamic>?> getProduct(String id) async {
    var client = http.Client();

    var uri =
        Uri.parse('https://world.openfoodfacts.org/api/v0/product/$id.json');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['product'];
    }
    return null;
  }
}

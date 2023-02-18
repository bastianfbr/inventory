import 'package:nanoid/nanoid.dart';

class Product {
  Product({this.name, this.brand, this.image, this.quantity}) {
    id = nanoid(10);
  }

  late String id;
  final String? name;
  final String? brand;
  final String? image;
  final String? quantity;
}

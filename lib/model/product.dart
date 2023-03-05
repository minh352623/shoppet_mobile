
import 'dart:convert';

import 'package:shoppet/model/images_product.dart';

List<Product> productListFromJson(String val) => List<Product>.from(
    json.decode(val).map((partner)=>Product.fromJson(partner))
);

class Product {
  final String name;
  final int id;
  final String price;
  final String image;
  // final List<ImagesProduct> images;
  final String number;

  Product({required this.name,required this.id,required this.price,required this.image,required this.number});

  factory Product.fromJson(Map<String,dynamic> data) => Product(id: data['id'], image: data['file_path'],name:data['name'],price: data['price'],number:data['number']);


}
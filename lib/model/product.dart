
import 'dart:convert';
import 'package:shoppet/model/images_product.dart';
import 'package:hive/hive.dart';
part 'product.g.dart';

List<Product> productListFromJson(String val) => List<Product>.from(
    json.decode(val).map((partner)=>Product.fromJson(partner))
);


@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String price;

  @HiveField(3)
  final String image;

  // final List<ImagesProduct> images;

  @HiveField(4)
  final String number;

  Product({required this.name,required this.id,required this.price,required this.image,required this.number});

  factory Product.fromJson(Map<String,dynamic> data) => Product(id: data['id'], image: data['file_path'],name:data['name'],price: data['price'],number:data['number']);


}
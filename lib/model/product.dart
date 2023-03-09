
import 'dart:convert';
import 'dart:ffi';
import 'package:shoppet/model/images_product.dart';
import 'package:hive/hive.dart';
part 'product.g.dart';

List<Product> productListFromJson(String val) => List<Product>.from(
    json.decode(val).map((product)=>Product.fromJson(product))
);


List<Product> productListPageFromJson(String val) => List<Product>.from(
    json.decode(val).map((product)=>Product.fromJsonPageProduct(product))
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


  @HiveField(4)
  final String number;


  @HiveField(5)
  final  start;

  @HiveField(6)
  final   description;
  // @HiveField(6)
  // final  List<String> images ;


  Product({required this.name,required this.id,required this.price,required this.image,required this.number,required this.start,required this.description});

  factory Product.fromJson(Map<String,dynamic> data) => Product(description: data['description'],id: data['id'], image: data['file_path'],name:data['name'],price: data['price'],number:data['number'], start: data['start']?.isEmpty  ? data['start'] : '0',


    // images:data['images'] != null ? List<String>.from(data['imageDetail'].map((image) => image['image_path'])):[],

  );


  factory Product.fromJsonPageProduct(Map<String,dynamic> data) => Product(
      description: data['description'],
      id: data['id'], image: data['file_path'],
      name:data['name'],price: data['price'],number:data['number'],
      start:data['start']?.isEmpty? data['start'] : '0',

      // images:data['images'] != null ? List<String>.from(data['imageDetail'].map((image) => image['image_path'])):[]

  );



}
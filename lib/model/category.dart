import 'dart:convert';
import 'package:hive/hive.dart';
part 'category.g.dart';

List<Category> categoryListFromJson(String val) => List<Category>.from(
    json.decode(val).map((partner)=>Category.fromJson(partner))
);

@HiveType(typeId: 4)

class Category {
  @HiveField(0)
  final id;

  @HiveField(1)
  final image;

  @HiveField(2)
  final name;


  Category({this.id,this.image,this.name});

  factory Category.fromJson(Map<String,dynamic> data) => Category(id: data['id'], image: data['image'],name:data['name']);
}
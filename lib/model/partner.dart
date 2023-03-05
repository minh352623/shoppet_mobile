import 'dart:convert';
import 'package:hive/hive.dart';
part 'partner.g.dart';

List<Partner> partnerListFromJson(String val) => List<Partner>.from(
    json.decode(val).map((partner)=>Partner.fromJson(partner))
);

@HiveType(typeId: 2)

class Partner {
  @HiveField(0)
  final id;

  @HiveField(1)
  final image;

  @HiveField(2)
  final name;


  Partner({this.id,this.image,this.name});

  factory Partner.fromJson(Map<String,dynamic> data) => Partner(id: data['id'], image: data['image'],name:data['name']);
}
import 'dart:convert';

List<Partner> partnerListFromJson(String val) => List<Partner>.from(
    json.decode(val).map((partner)=>Partner.fromJson(partner))
);
class Partner {
  final id;
  final image;
  final name;


  Partner({this.id,this.image,this.name});

  factory Partner.fromJson(Map<String,dynamic> data) => Partner(id: data['id'], image: data['image'],name:data['name']);
}
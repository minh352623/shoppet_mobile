
import 'dart:convert';

List<ImagesProduct> imagesProduct(String val) => List<ImagesProduct>.from(
    json.decode(val).map((partner)=>ImagesProduct.fromJson(partner))
);

class ImagesProduct {
  final int id;
  final String image;


  ImagesProduct({required this.id,required this.image});

  factory ImagesProduct.fromJson(Map<String,dynamic> data) => ImagesProduct(id: data['id'], image: data['image_path']);


}
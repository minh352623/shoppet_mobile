import 'dart:convert';


List<AdBanner> adBannerListFromJson(String val) => List<AdBanner>.from(
  json.decode(val).map((banner)=>AdBanner.fromJson(banner))
);

class AdBanner {
  final int id ;
  final String image ;

  AdBanner({required this.id, required this.image});

  factory AdBanner.fromJson(Map<String,dynamic> data) => AdBanner(id: data['id'], image: data['file_path']);
}

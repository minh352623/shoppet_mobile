import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shoppet/model/ad_banner.dart';

class LocalBannerService {
  late Box<AdBanner> _adBannerBox;

  Future<void> init ()async {
    _adBannerBox = await Hive.openBox<AdBanner>('AdBanner');
  }

  Future<void> assignAllAdBanners({required List<AdBanner> adBanners})async{
        await  _adBannerBox.clear();
        await _adBannerBox.addAll(adBanners);
  }

  List<AdBanner> getAdBanners() => _adBannerBox.values.toList();
}
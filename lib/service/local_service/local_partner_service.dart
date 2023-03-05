import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shoppet/model/partner.dart';

class LocalPartnerService {
  late Box<Partner> _partnerBox;

  Future<void> init ()async {
    _partnerBox = await Hive.openBox<Partner>('Partner');
  }

  Future<void> assignAllPartners({required List<Partner> Partners})async{
    await  _partnerBox.clear();
    await _partnerBox.addAll(Partners);
  }

  List<Partner> getPartners() => _partnerBox.values.toList();
}
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shoppet/model/product.dart';

class LocalProductService {
  late Box<Product> _productBox;

  Future<void> init ()async {
    _productBox = await Hive.openBox<Product>('Product');
  }

  Future<void> assignAllProducts({required List<Product> Products}) async {
    await  _productBox.clear();
    await _productBox.addAll(Products);
  }

  List<Product> getProducts() => _productBox.values.toList();
}
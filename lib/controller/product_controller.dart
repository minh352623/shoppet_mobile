import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoppet/model/product.dart';
import 'package:shoppet/service/remote_service/remote_product_page_service.dart';

class ProductController extends GetxController{
  static  ProductController instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxString searchVal = ''.obs;
  RxBool isProductLoading = false.obs;


  void onInit() async {
    getBestSalerProducts();
    super.onInit();
  }

  void getBestSalerProducts()async {
    try {
      isProductLoading(true);
      // if(_localProductService.getProducts().isNotEmpty){
      //   productList.assignAll(_localProductService.getProducts());
      // }
      var result = await RemoteProductPageService().get();

      if (result != null) {

        // for (var familyMember in jsonDecode(result.body)) { //prints the name of each family member
        //   var familyMemberName = familyMember["images"];
        //   for (var image in familyMemberName) {
        //     print(image['image_path']);
        //
        //   }
        // }


        productList.assignAll(productListPageFromJson((result.body)));

        //save api result to local db
        // _localProductService.assignAllProducts(Products: productListFromJson(result.body));
      }
    } on Exception catch (e){
      print(e);
    }finally{



      isProductLoading(false);
    }
  }


  void getProductByName({required String keyword})async{
    try{
      isProductLoading(true);

      var result = await RemoteProductPageService().getByName(keyword: keyword);
      if(result != null){
        productList.assignAll(productListPageFromJson((result.body)));

      }
    }finally{
      print(productList.length);
      isProductLoading(false);

    }
  }

  void getProductByCategory({required int id}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductPageService().getByCategory(id: id);
      if(result != null){
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }
}
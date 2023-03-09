

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoppet/model/category.dart';
import 'package:shoppet/service/remote_service/remote_category_service.dart';


class CategoryController extends GetxController{
  static  CategoryController instance = Get.find();
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxBool isCategoryLoading = false.obs;

  void onInit() async {
    getCategory();
    super.onInit();
  }

  void getCategory()async {
    try {
      isCategoryLoading(true);
      // if(_localProductService.getProducts().isNotEmpty){
      //   productList.assignAll(_localProductService.getProducts());
      // }
      var result = await RemoteCategoryService().get();

      if (result != null) {
        categoryList.assignAll(categoryListFromJson((result.body)));
        //save api result to local db
        // _localProductService.assignAllProducts(Products: productListFromJson(result.body));
      }
    } on Exception catch (e){
      print(e);
    }finally{
      print(categoryList.length);
      isCategoryLoading(false);
    }
  }


}
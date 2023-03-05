import 'package:get/get.dart';
import 'package:shoppet/model/product.dart';
import 'package:shoppet/service/remote_service/remote_product_page_service.dart';

class ProductController extends GetxController{
  static  ProductController instance = Get.find();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;

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


        productList.assignAll(productListPageFromJson((result.body)));

        //save api result to local db
        // _localProductService.assignAllProducts(Products: productListFromJson(result.body));
      }
    } on Exception catch (e){
      print(e);
    }finally{
      print( productList.length);



      isProductLoading(false);
    }
  }
}
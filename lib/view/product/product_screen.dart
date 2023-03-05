import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppet/component/main_header.dart';
import 'package:shoppet/controller/controllers.dart';
import 'package:shoppet/view/product/components/product_grid.dart';
import 'package:shoppet/view/product/components/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Column(
      children: [
        MainHeader(),
        Expanded(child: Obx((){
          if(productController.productList.isNotEmpty){
            return ProductGrid(products: productController.productList);
          }else{
            return ProductLoadingGrid();

          }
        }),)
      ],
    ));
  }
}

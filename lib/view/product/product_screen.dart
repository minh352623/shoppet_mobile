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
          if(productController.isProductLoading.value){
            return ProductLoadingGrid();

          }else{
            if(productController.productList.isNotEmpty){
              return ProductGrid(products: productController.productList);
            }else{
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/404notfound.png'),
                    const SizedBox(height: 10,),
                    const Text('Product not found',style:TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange
                    ),)
                  ],
                );


            }
          }

        }),)
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:badges/src/badge.dart' as badge;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoppet/controller/controllers.dart';
class MainHeader extends StatelessWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10
          )
        ]
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Container(
            child:Obx(()=> TextField(
              autofocus: false,
              controller: productController.searchTextEditController,
              onSubmitted: (val){
                productController.getProductByName(keyword: val);
                dashboardController.updateIndex(1);
              },
              onChanged: (val){
                productController.searchVal.value = val;

              },
              decoration: InputDecoration(
                suffixIcon: productController.searchVal.value.isNotEmpty ? IconButton(onPressed: (){
                  FocusScope.of(context).requestFocus(FocusScopeNode());
                  productController.searchTextEditController.clear();
                  productController.searchVal.value ="";
                  productController.getBestSalerProducts();
                }, icon: const Icon(Icons.clear)):null,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16

                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none
                  ),
                  hintText: "Search..",
                  prefixIcon: const Icon(Icons.search)
              ),
            )),
          )),
          const SizedBox(width:10),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  blurRadius: 4
                )
              ]
            ),
            padding:const EdgeInsets.all(12),
            child: Icon(Icons.filter_alt_outlined,color: Colors.grey,),
          ),
          const SizedBox(width:10),
          //https://stackoverflow.com/questions/75235563/error-badge-is-being-imported-from-2-dart-sources
          badge.Badge(
            badgeContent:Text('1',style: TextStyle(color: Colors.white),),
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        blurRadius: 4
                    )
                  ]
              ),
              padding:const EdgeInsets.all(12),
              child: Icon(Icons.shopping_cart_outlined,color: Colors.orange,),
            ),
          ),
          const SizedBox(width:5),

        ],
      ) ,
    );
  }
}

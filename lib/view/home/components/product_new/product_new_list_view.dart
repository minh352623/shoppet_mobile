import 'package:flutter/material.dart';
import 'package:shoppet/model/product.dart';
import 'package:shoppet/view/home/components/product_new/product_new_card.dart';


class ProductNewListView extends StatelessWidget {
  final List<Product> listProducts;
  const ProductNewListView({Key? key, required this.listProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: listProducts.length,
          itemBuilder: (context, index) => ProductNewCard(product: listProducts[index])),
    );
  }
}
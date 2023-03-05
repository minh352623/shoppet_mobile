import 'package:flutter/material.dart';
import 'package:shoppet/view/home/components/product_new/product_new_card_loading.dart';


class ProductNewLoading extends StatelessWidget {
  const ProductNewLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => const ProductNewCardLoading()),
    );;
  }
}

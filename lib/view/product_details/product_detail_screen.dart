import 'package:flutter/material.dart';
import 'package:shoppet/component/main_header.dart';
import 'package:shoppet/model/product.dart';
import 'package:shoppet/view/product_details/product_carousel_slider.dart';


class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            ProductCarouselSlider(images:[
              "https://res.cloudinary.com/dnfe9k4jv/image/upload/v1664838362/lu4wtpzzk4t03wg6yzvz.jpg",
              "https://res.cloudinary.com/dnfe9k4jv/image/upload/v1664858518/xfnit5aarczq3mtalm4n.jpg"
            ] ),
            const SizedBox(height: 10,),
            Text(product.name,style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600
            ),)
          ],
        ),
      )
    );
  }
}

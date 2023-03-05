import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shoppet/model/product.dart';
import 'package:shimmer/shimmer.dart';

class ProductNewCard extends StatelessWidget {
 final Product product;
  const ProductNewCard({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,10,5,10),
      child: Material(
        elevation: 8,

        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Container(

          margin: const EdgeInsets.all(10),
          width: 120,
          child: Column(
            children: [
              AspectRatio(aspectRatio: 0.9,child: CachedNetworkImage(
                imageUrl: product.image,
                placeholder: (context,url)=>Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey.shade300,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: 120,
                    child: Column(
                      children: [
                        AspectRatio(aspectRatio: 0.9,
                          child: Container(
                            color: Colors.grey,
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 25
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: Container(
                            height: 15,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Material(
                  elevation: 8,
                  shadowColor: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 270,
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left:10,bottom: 5),
                child: Text(product.name,style:const TextStyle(
                  color: Colors.black87,
                  fontSize: 14
                ),
                maxLines: 1 ,
                ),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left:10,bottom: 5),
                child: Text("\$ "+product.price,style:const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 14
                ),
                  maxLines: 1 ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

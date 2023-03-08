import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shoppet/component/main_header.dart';
import 'package:shoppet/model/product.dart';
import 'package:shoppet/view/product_details/product_carousel_slider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({Key? key,required this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  NumberFormat formatter = NumberFormat('00');
  int _qty = 1;
  int _tagIndex = 0;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductCarouselSlider(images:[
                "https://res.cloudinary.com/dnfe9k4jv/image/upload/v1664838362/lu4wtpzzk4t03wg6yzvz.jpg",
                "https://res.cloudinary.com/dnfe9k4jv/image/upload/v1664858518/xfnit5aarczq3mtalm4n.jpg"
              ] ),

              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(widget.product.name,style: TextStyle(
                            fontSize: 24,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('\$ ${widget.product.price}',style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400
                        ),),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border:Border.all(
                                      width:1
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(8))

                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          if(_qty >1){
                                            _qty--;
                                          }
                                        });
                                      },
                                      child: Icon(Icons.keyboard_arrow_left_sharp,size: 50,color:Colors.grey.shade800,),
                                    ),
                                    Text(formatter.format(_qty),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          _qty++;
                                        });
                                      },
                                      child: Icon(Icons.keyboard_arrow_right_sharp,size: 50,color:Colors.grey.shade800,),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Flexible(
                          child: RichText(
                            maxLines: 12,
                            overflow: TextOverflow.ellipsis,
                            strutStyle: StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                                style: TextStyle(color: Colors.grey,fontSize: 18),
                                text: widget.product.description),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),

          ),
          onPressed: (){},
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Add to cart',style: TextStyle(fontSize: 16),),
          ),
        ),
      ),
    );
  }
}

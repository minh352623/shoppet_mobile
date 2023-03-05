import 'package:flutter/material.dart';
import 'package:shoppet/component/main_header.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Column(
      children: [
        MainHeader(),
        Expanded(child: Container())
      ],
    ));
  }
}

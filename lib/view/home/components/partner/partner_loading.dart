import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppet/view/home/components/partner/partner_loading_card.dart';


class PartnerLoading extends StatelessWidget {
  const PartnerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => const PartnerLoadingCard()),
    );
  }
}
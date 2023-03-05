import 'package:flutter/material.dart';
import 'package:shoppet/model/partner.dart';
import 'package:shoppet/view/home/components/partner/partner_card.dart';

class PartnerSliderView extends StatelessWidget {
  final List<Partner> partners;
  const PartnerSliderView({Key? key,
    required this.partners
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: partners.length,
          itemBuilder: (context, index) => PartnerCard(
              partner: partners[index]
          )
      ),
    );
  }
}
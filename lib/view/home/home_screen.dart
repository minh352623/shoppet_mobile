import 'package:flutter/material.dart';
import 'package:shoppet/component/main_header.dart';
import 'package:shoppet/controller/controllers.dart';
import 'package:shoppet/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:get/get.dart';
import 'package:shoppet/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:shoppet/view/home/components/partner/partner_loading.dart';
import 'package:shoppet/view/home/components/partner/partner_slider_view.dart';
import 'package:shoppet/view/home/components/product_new/product_new_list_view.dart';
import 'package:shoppet/view/home/components/product_new/product_new_loading.dart';
import 'package:shoppet/view/home/components/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        MainHeader(),
        Expanded(child: SingleChildScrollView(
          physics:const  BouncingScrollPhysics(),
          child: Column(
            children: [
              Obx((){
                if(homeController.bannerList.isNotEmpty){
                  return CarouselSliderView(bannerList: homeController.bannerList);
                }else{
                  return CarouselLoading();

                }
              }),
              const SectionTitle(title:"Partner"),
              Obx((){
                if(homeController.partnerList.isNotEmpty){
                  return PartnerSliderView(partners:homeController.partnerList);
                }else{
                  return PartnerLoading();

                }
              }),
              const SectionTitle(title:"Product new"),
              Obx((){
                if(homeController.productList.isNotEmpty){
                  return ProductNewListView(listProducts: homeController.productList);
                }else{
                  return ProductNewLoading();

                }
              }),
            ],
          ),
        )),
      ],
    ));
  }
}

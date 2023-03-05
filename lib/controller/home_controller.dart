import 'package:get/get.dart';
import 'package:shoppet/model/ad_banner.dart';
import 'package:shoppet/model/partner.dart';
import 'package:shoppet/model/product.dart';
import 'package:shoppet/service/local_service/local_banner_service.dart';
import 'package:shoppet/service/local_service/local_partner_service.dart';
import 'package:shoppet/service/local_service/local_product_service.dart';
import 'package:shoppet/service/remote_service/remote_banner_service.dart';
import 'package:shoppet/service/remote_service/remote_partner_server.dart';
import 'package:shoppet/service/remote_service/remote_product_new_service.dart';


class HomeController extends GetxController {
  static  HomeController instance = Get.find();

  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Partner> partnerList = List<Partner>.empty(growable: true).obs;
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  final LocalBannerService _localBannerService = LocalBannerService();
  final LocalPartnerService _localPartnerService = LocalPartnerService();
  final LocalProductService _localProductService = LocalProductService();

  RxBool isBannerLoading = false.obs;
  RxBool isPartnerLoading = false.obs;
  RxBool isProductLoading = false.obs;

  void onInit() async {
    await _localBannerService.init();
    await _localPartnerService.init();
    await _localProductService.init();

    getAdBanners();
    getPartners();
    getNewProducts();
    super.onInit();
  }

  void getAdBanners()async {
    try {
      isBannerLoading(true);


      //assigning banner before call api
      if(_localBannerService.getAdBanners().isNotEmpty){
          bannerList.assignAll(_localBannerService.getAdBanners());
      }
      //call api
      var result = await RemoteBannerService().get();

      if (result != null) {
        // print(result.body);
        //asigning api result
        bannerList.assignAll(adBannerListFromJson((result.body)));


        //save api result to local db
        _localBannerService.assignAllAdBanners(adBanners: adBannerListFromJson(result.body));
      }
    } on Exception catch (e){
      print(e);
    }finally{
      // print('hello');
      // print(bannerList.first.image);

      isBannerLoading(false);
    }
  }

  void getPartners()async {
    try {
      isPartnerLoading(true);
      //assigning banner before call api
      if(_localPartnerService.getPartners().isNotEmpty){
        partnerList.assignAll(_localPartnerService.getPartners());
      }
      var result = await RemotePartnerService().get();

      if (result != null) {


        partnerList.assignAll(partnerListFromJson((result.body)));

        //save api result to local db
        _localPartnerService.assignAllPartners(Partners: partnerListFromJson(result.body));
      }
    } on Exception catch (e){
      print(e);
    }finally{

      print(partnerList.first.image);

      isPartnerLoading(false);
    }
  }

  void getNewProducts()async {
    try {
      isProductLoading(true);
      if(_localProductService.getProducts().isNotEmpty){
        productList.assignAll(_localProductService.getProducts());
      }
      var result = await ProductNewService().get();

      if (result != null) {


        productList.assignAll(productListFromJson((result.body)));

        //save api result to local db
        _localProductService.assignAllProducts(Products: productListFromJson(result.body));
      }
    } on Exception catch (e){
      print(e);
    }finally{



      isProductLoading(false);
    }
  }
}
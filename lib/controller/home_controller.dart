import 'package:get/get.dart';
import 'package:shoppet/model/ad_banner.dart';
import 'package:shoppet/model/partner.dart';
import 'package:shoppet/model/product.dart';
import 'package:shoppet/service/remote_service/remote_banner_service.dart';
import 'package:shoppet/service/remote_service/remote_partner_server.dart';
import 'package:shoppet/service/remote_service/remote_product_new_service.dart';


class HomeController extends GetxController {
  static  HomeController instance = Get.find();

  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Partner> partnerList = List<Partner>.empty(growable: true).obs;
  RxList<Product> productList = List<Product>.empty(growable: true).obs;


  RxBool isBannerLoading = false.obs;
  RxBool isPartnerLoading = false.obs;
  RxBool isProductLoading = false.obs;

  void onInit(){
    getAdBanners();
    getPartners();
    getNewProducts();
    super.onInit();
  }

  void getAdBanners()async {
    try {
      isBannerLoading(true);

      var result = await RemoteBannerService().get();

      if (result != null) {
        // print(result.body);

        bannerList.assignAll(adBannerListFromJson((result.body)));
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

      var result = await RemotePartnerService().get();

      if (result != null) {


        partnerList.assignAll(partnerListFromJson((result.body)));
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

      var result = await ProductNewService().get();

      if (result != null) {


        productList.assignAll(productListFromJson((result.body)));
      }
    } on Exception catch (e){
      print(e);
    }finally{



      isProductLoading(false);
    }
  }
}
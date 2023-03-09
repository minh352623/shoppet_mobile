

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shoppet/model/user.dart';
import 'package:shoppet/service/remote_service/remote_auth_service.dart';


class AuthController extends GetxController{
  static  AuthController instance = Get.find();
  Rxn<User> user = Rxn<User>();
  RxBool isAuthLoading = false.obs;

  void onInit() async {
    super.onInit();
  }

  void register({required String email,required String name,required String password})async {
    try{
      EasyLoading.show(
        status: "Loading...",
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().register(email: email,password: password);

      if(result != null ){
          EasyLoading.showSuccess("Bạn có thể đăng nhập ngay bây giờ");
          Navigator.of(Get.overlayContext!).pop();
      }else{
        EasyLoading.showError("Something wrong. try again");
      }

    }finally{
      EasyLoading.dismiss();
    }
  }



}
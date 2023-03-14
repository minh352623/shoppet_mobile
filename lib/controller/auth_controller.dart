

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shoppet/model/user.dart';
import 'package:shoppet/service/local_service/local_auth_service.dart';
import 'package:shoppet/service/remote_service/remote_auth_service.dart';


class AuthController extends GetxController{
  static  AuthController instance = Get.find();
  var _data;
  Rxn<User> user = Rxn<User>();
  RxBool isAuthLoading = false.obs;
  final LocalAuthService _localAuthService = LocalAuthService();
  void onInit() async {
    _localAuthService.init();
    super.onInit();
  }

  void register({required String email,required String name,required String password})async {
    try {
      EasyLoading.show(
        status: "Loading...",
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().register(
          email: email, password: password);

      if (result != null) {
        EasyLoading.showSuccess("Bạn có thể đăng nhập ngay bây giờ");
        Navigator.of(Get.overlayContext!).pop();
      } else {
        EasyLoading.showError("Something wrong. try again");
      }
    }catch(e){
      EasyLoading.showError("Something wrong. try again");

    }finally{
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().login(
        email: email,
        password: password,
      );
      if(result != null) {
          print(result.body);
        String token = json.decode(result.body)['token'];
          user.value = userFromJson(result.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Welcome to MyGrocery!");
          Navigator.of(Get.overlayContext!).pop();

      } else {
        EasyLoading.showError('Username/password wrong');
      }
    } catch(e){
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value = null;
    await _localAuthService.clear();
  }


}
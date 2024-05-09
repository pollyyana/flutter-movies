import 'package:flutter/material.dart';
import 'package:get/get.dart';

//herança
mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loaderRx) {
    //ever vai executar uma funçao
    ever<bool>(loaderRx, (loading) async {
      if (loading) {
        await Get.dialog(
          const Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}

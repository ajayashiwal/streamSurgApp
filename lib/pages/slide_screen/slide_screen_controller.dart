import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlideScreenController extends GetxController {
  int currentIndex = 0;
  late PageController controller;
  double pagePercent = 0.30;
  @override
  void onInit() {
    controller = PageController(initialPage: 0);

    super.onInit();

  }
  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
  void onPageChanged(int index) {
    controller.animateToPage(index,
        duration: const Duration(milliseconds: 150), curve: Curves.linear);
    if (index == 0) {
      pagePercent = 0.33;
    } else if (index == 1) {
      pagePercent = 0.50;
    } else if (index == 2) {
      pagePercent = 1.0;
    }
    currentIndex = index;
    update();
  }

}

import 'package:get/get.dart';
import 'package:streamsurg/pages/splash_page/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(SplashController.new);
  }
}

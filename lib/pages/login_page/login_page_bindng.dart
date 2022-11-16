import 'package:get/get.dart';
import 'package:streamsurg/pages/login_page/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(LoginPageController.new);
  }
}

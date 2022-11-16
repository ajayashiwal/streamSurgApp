import 'package:get/get.dart';
import 'package:streamsurg/pages/register_page/register_page_controller.dart';

class RegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(RegisterPageController.new);
  }
}

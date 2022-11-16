import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/special_request_page_controller.dart';

class SpecialRequestPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(SpecialRequestPageController.new);
  }
}

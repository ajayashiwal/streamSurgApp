import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/customer_support_page_controller.dart';

class CustomerSupportPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CustomerSupportPageController.new);
  }
}

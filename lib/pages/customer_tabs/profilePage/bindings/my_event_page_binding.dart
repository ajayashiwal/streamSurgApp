import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/profile_page_controller.dart';

class MyEventPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ProfilePageController.new);
  }
}

import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/controllers/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(HomePageController.new);
  }
}

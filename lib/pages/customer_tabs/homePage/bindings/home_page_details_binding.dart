import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/controllers/home_page_details_controller.dart';

class HomePageDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(HomePageDetailsController.new);
  }
}

import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/rewards_page_controller.dart';

class RewardsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(RewardsPageController.new);
  }
}

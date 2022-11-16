import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/join_events_page_controller.dart';

class JoinEventPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(JoinEventPageController.new);
  }
}

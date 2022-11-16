import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/events_details_page_controller.dart';

class EventDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EventDetailsPageController.new);
  }
}

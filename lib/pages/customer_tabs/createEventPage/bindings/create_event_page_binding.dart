import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/createEventPage/controllers/create_event_page_controller.dart';

class CreateEventPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(CreateEventPageController.new);
  }
}

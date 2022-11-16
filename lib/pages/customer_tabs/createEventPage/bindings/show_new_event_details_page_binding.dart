import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/createEventPage/controllers/show_new_event_details_page_controllerdart.dart';

class ShowNewEventDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(ShowNewEventDetailsPageController.new);
  }
}

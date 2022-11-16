import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/notificationPage/controllers/notification_page_controller.dart';

class NotificationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(NotificationPageController.new);
  }
}

import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/controllers/payment_booking_page_controller.dart';

class PaymentBookingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(PaymentBookingPageController.new);
  }
}

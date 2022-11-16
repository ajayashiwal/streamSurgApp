import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/payment_receipt_page_controller.dart';

class PaymentReciptPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(PaymentReceiptPageController.new);
  }
}

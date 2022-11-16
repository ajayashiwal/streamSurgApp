import 'package:get/get.dart';
import 'package:streamsurg/pages/otp_Page/otp_page_controller.dart';

class OtpPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(OtpPageController.new);
  }
}

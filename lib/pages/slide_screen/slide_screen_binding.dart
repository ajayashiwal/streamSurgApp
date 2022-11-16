import 'package:get/get.dart';
import 'package:streamsurg/pages/slide_screen/slide_screen_controller.dart';

class SlideScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(SlideScreenController.new);
  }
}

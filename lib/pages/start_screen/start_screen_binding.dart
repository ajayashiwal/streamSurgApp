import 'package:get/get.dart';
import 'package:streamsurg/pages/start_screen/start_screen_controller.dart';

class StartScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(StartScreenController.new);
  }
}

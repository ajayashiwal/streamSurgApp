import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/edit_profile_page_controller.dart';

class EditProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EditProfilePageController.new);
  }
}

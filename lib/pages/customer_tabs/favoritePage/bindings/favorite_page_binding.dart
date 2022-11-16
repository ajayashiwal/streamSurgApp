import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/favoritePage/controllers/favorite_page_controller.dart';

class FavoritePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(FavoritePageController.new);
  }
}

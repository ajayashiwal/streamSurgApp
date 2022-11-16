import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/createEventPage/controllers/create_event_page_controller.dart';
import 'package:streamsurg/pages/customer_tabs/dashboard_bar/dashboard_bar_controller.dart';
import 'package:streamsurg/pages/customer_tabs/favoritePage/controllers/favorite_page_controller.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/controllers/home_page_controller.dart';
import 'package:streamsurg/pages/customer_tabs/notificationPage/controllers/notification_page_controller.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/profile_page_controller.dart';


class DashBoardPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(DashBoardPageController.new);
    Get.lazyPut(HomePageController.new);
    Get.lazyPut(FavoritePageController.new);
    Get.lazyPut(CreateEventPageController.new);
    Get.lazyPut(NotificationPageController.new);
    Get.lazyPut(ProfilePageController.new);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:streamsurg/appStyle/app_colors.dart';
import 'package:streamsurg/appStyle/app_dimensions.dart';
import 'package:streamsurg/pages/customer_tabs/createEventPage/presentation/create_event_page_view.dart';
import 'package:streamsurg/pages/customer_tabs/favoritePage/presentation/favorite_page_view.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/presentation/home_page_view.dart';
import 'package:streamsurg/pages/customer_tabs/notificationPage/presentation/notification_page_view.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/presentation/profile_page_view.dart';

import '../../../appStyle/assets_images.dart';


class DashBoardPageController extends GetxController {
  int currentTab=0;
  void onTabTapped(int index){
    currentTab =index;
    update();

  }
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
  List<Widget> buildScreens() {
    return [
      HomePageView(),
      FavoritePageView(),
      CreateEventPageView(),
      NotificationPageView(),
      ProfilePageView(),
    ];
  }
  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: AppDimensions.padding8,
          child: Image.asset(AssetsBase.homeIcon,height: AppDimensions.twentyFive,width: AppDimensions.twentyFive,),
        ),
        inactiveIcon: Padding(
          padding: AppDimensions.padding8,
          child: Image.asset(AssetsBase.homeInactiveIcon,height: AppDimensions.twentyFive,width: AppDimensions.twentyFive,),
        ),

      ),
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: AppDimensions.padding8,
          child: Image.asset(AssetsBase.favoriteActiveIcon,height: AppDimensions.twentyFive,width: AppDimensions.twentyFive),
        ),
        inactiveIcon: Padding(
          padding: AppDimensions.padding8,
          child: Image.asset(AssetsBase.favoriteIcon,height: AppDimensions.twentyFive,width: AppDimensions.twentyFive),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(AssetsBase.ticketIcon),
        activeColorPrimary: AppColors.orangeColor,
        inactiveIcon: Image.asset(AssetsBase.ticketIcon),
      ),
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: AppDimensions.padding8,
          child: Image.asset(AssetsBase.notificationActiveIcon,height: AppDimensions.twentyFive,width: AppDimensions.twentyFive),
        ),
        inactiveIcon: Padding(
          padding: AppDimensions.padding8,
          child: Image.asset(AssetsBase.notificationIcon,height: AppDimensions.twentyFive,width: AppDimensions.twentyFive),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Padding(
          padding: AppDimensions.padding8,
          child: Image.asset(AssetsBase.profileActiveIcon,height: AppDimensions.twentyFive,width: AppDimensions.twentyFive),
        ),
        inactiveIcon: Padding(
          padding: AppDimensions.padding8,
          child: Image.asset(AssetsBase.profileIcon,height: AppDimensions.twentyFive,width: AppDimensions.twentyFive),
        ),
      ),
    ];
  }

}

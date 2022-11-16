import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:streamsurg/appStyle/app_colors.dart';
import 'package:streamsurg/pages/customer_tabs/dashboard_bar/dashboard_bar_controller.dart';


// ignore: must_be_immutable
class DashBoardBarView extends StatelessWidget {
  int?  isSelected;
  DashBoardBarView({Key? key,this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardPageController>(
        builder: (controller) {
          if(isSelected!=null){
            controller.controller=PersistentTabController(initialIndex: isSelected!);
          }
          return PersistentTabView(
            context,
            controller: controller.controller,
            screens: controller.buildScreens(),
            items:controller.navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: AppColors.whiteColor, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: false, // Default is true.
            hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: AppColors.whiteColor,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            navBarStyle: NavBarStyle.style15 // Choose the nav bar style with this property.
          );
        }
    );
  }

}

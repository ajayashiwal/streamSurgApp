import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/appStyle/assets_images.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/rewards_page_controller.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../utils/app_strings.dart';


// ignore: must_be_immutable
class RewardsPageView extends StatelessWidget {
  RewardsPageView({Key? key}) : super(key: key);
  var dsh = Get.isRegistered<RewardsPageController>()
      ? Get.find<RewardsPageController>()
      : Get.put(RewardsPageController());
  @override
  Widget build(BuildContext context) {
    dsh.onInit();
    return GetBuilder<RewardsPageController>(
        builder: (controller) {
          return  Scaffold(
              backgroundColor: AppColors.whiteColor,
              resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                preferredSize:  Size.fromHeight(AppDimensions.fifty),
                child: AppBar(
                  elevation: 0,
                  leading:Padding(
                    padding: AppDimensions.padding15,
                    child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Image.asset(AssetsBase.clearIcon,height: AppDimensions.twenty,width: AppDimensions.twenty)),
                  ) ,
                  backgroundColor: AppColors.whiteColor,
                  title: Text(AppStrings.rewards,style: AppThemeStyles.black18,),
                  centerTitle: true,
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetsBase.rewardsImage,height: AppDimensions.hundred,width: AppDimensions.hundred),
                  SizedBox(height: AppDimensions.ten),
                  Text(AppStrings.earnPoints,style: AppThemeStyles.blackMedium16),
                  SizedBox(height: AppDimensions.ten),
                  Padding(
                    padding: AppDimensions.margin0_20_20_0,
                    child: Text(AppStrings.referToYourFriendsAndFamily,style: AppThemeStyles.red16,textAlign: TextAlign.center),
                  ),
                  SizedBox(height: AppDimensions.twenty),
                  Text(AppStrings.learnMore,style: AppThemeStyles.blackMedium14),
                  SizedBox(height: AppDimensions.fifty),


                ],
              )

          );
        }
    );
  }

}

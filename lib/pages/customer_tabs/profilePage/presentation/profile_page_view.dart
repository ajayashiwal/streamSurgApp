import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/profile_page_controller.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../appStyle/assets_images.dart';
import '../../../../navigation/app_route_maps.dart';
import '../../../../utils/app_strings.dart';


// ignore: must_be_immutable
class ProfilePageView extends StatelessWidget {
   ProfilePageView({Key? key}) : super(key: key);

  var dsh = Get.isRegistered<ProfilePageController>()
      ? Get.find<ProfilePageController>()
      : Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    dsh.onInit();
    return GetBuilder<ProfilePageController>(
        builder: (controller) {
          return  Scaffold(
              backgroundColor: AppColors.whiteColor,
              resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                preferredSize:  Size.fromHeight(AppDimensions.fifty),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: AppColors.whiteColor,
                  title: Text(AppStrings.settings,style: AppThemeStyles.black18,),
                  centerTitle: true,
                ),
              ),
            body: SingleChildScrollView(
              child: Padding(
                padding: AppDimensions.padding20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:AppDimensions.margin20_0_0_20,
                      child: Row(
                        children: [
                          Image.asset(AssetsBase.profileIcon,height: AppDimensions.twenty,width: AppDimensions.twenty),
                          SizedBox(width: AppDimensions.ten),
                          Text(AppStrings.account,style: AppThemeStyles.blackMedium14,),
                        ],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: (){
                        AppRouteMaps.goToEditProfilePage();
                      },
                      child: Padding(
                        padding: AppDimensions.margin20_0_0_20,
                        child: Row(
                          children: [
                            Text(AppStrings.editProfile,style: AppThemeStyles.blackMedium14,),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: (){
                        AppRouteMaps.goToMyEventPage();
                      },
                      child: Padding(
                        padding: AppDimensions.margin20_0_0_20,
                        child: Row(
                          children: [
                            Text(AppStrings.myEvents,style: AppThemeStyles.blackMedium14,),
                          ],
                        ),
                      ),
                    ),

                    const Divider(),
                InkWell(
                  onTap: (){
                    AppRouteMaps.goToJoinEventPage();
                  },
                  child: Padding(
                    padding: AppDimensions.margin20_0_0_20,
                    child: Row(
                      children: [
                        Text(AppStrings.jotinedEvents,style: AppThemeStyles.blackMedium14,),
                      ],
                    ),
                  ),
                ),
                    const Divider(),

                InkWell(
                  onTap: (){
                    AppRouteMaps.goToSpecialRequestPage();
                  },
                  child: Padding(
                    padding: AppDimensions.margin20_0_0_20,
                    child: Row(
                      children: [
                        Text(AppStrings.specialRequest,style: AppThemeStyles.blackMedium14,),
                      ],
                    ),
                  ),
                ),
                    const Divider(),
                InkWell(
                  onTap: (){
                    AppRouteMaps.goToCustomerSupportPage();
                  },
                  child: Padding(
                    padding: AppDimensions.margin20_0_0_20,
                    child: Row(
                      children: [
                        Text(AppStrings.customerSupport,style: AppThemeStyles.blackMedium14,),
                      ],
                    ),
                  ),
                ),
                    const Divider(),
                InkWell(
                  onTap: (){
                    AppRouteMaps.goToPaymentReceiptPage();
                  },
                  child: Padding(
                    padding: AppDimensions.margin20_0_0_20,
                    child: Row(
                      children: [
                        Text(AppStrings.bookingPayment,style: AppThemeStyles.blackMedium14,),
                      ],
                    ),
                  ),
                ),


                    const Divider(),
                InkWell(
                  onTap: (){
                    AppRouteMaps.goToRewardsPage();
                  },
                  child: Padding(
                    padding: AppDimensions.margin20_0_0_20,
                    child: Row(
                      children: [
                        Text(AppStrings.rewardes,style: AppThemeStyles.blackMedium14,),
                      ],
                    ),
                  ),
                ),
                    const Divider(),
                    InkWell(
                      onTap: (){
                        Get.dialog(
                          // barrierDismissible: false,
                          AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              backgroundColor: AppColors.whiteOrangeColor,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(AppDimensions.ten),
                                  borderSide:  BorderSide(color: AppColors.whiteColor.withOpacity(0.1))

                              ),
                              content: Padding(
                                padding: AppDimensions.padding20,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      AppStrings.logoutFromThisDevice,
                                      style: AppThemeStyles.black14,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: AppDimensions.twenty),

                                    Padding(
                                      padding: AppDimensions.margin0_10_10_0,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap:(){
                                                AppRouteMaps.goToStartPage();

                                              },
                                              child: Container(
                                                height: AppDimensions.forty,
                                                decoration: BoxDecoration(
                                                    color: AppColors.orangeColor,
                                                    borderRadius: BorderRadius.circular(AppDimensions.twenty)
                                                ),
                                                child: Center(child: Text(AppStrings.yes,style: AppThemeStyles.whiteMedium18)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: AppDimensions.twenty),
                                          Expanded(
                                            child: InkWell(
                                              onTap: (){
                                                Get.back();
                                              },
                                              child: Container(
                                                height: AppDimensions.forty,
                                                decoration: BoxDecoration(
                                                    color: AppColors.blackLightColor,
                                                    borderRadius: BorderRadius.circular(AppDimensions.twenty)
                                                ),
                                                child: Center(child: Text(AppStrings.cancel,style: AppThemeStyles.whiteMedium18)),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        );

                      },
                      child: Padding(
                        padding: AppDimensions.margin20_0_0_20,
                        child: Row(
                          children: [
                            Text(AppStrings.logout,style: AppThemeStyles.blackMedium14,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )

          );
        }
    );
  }

}

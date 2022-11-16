import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/appStyle/app_colors.dart';
import 'package:streamsurg/appStyle/app_theme_styles.dart';
import 'package:streamsurg/appstyle/app_dimensions.dart';
import 'package:streamsurg/navigation/app_route_maps.dart';
import 'package:streamsurg/pages/start_screen/start_screen_controller.dart';
import 'package:streamsurg/utils/app_strings.dart';
import '../../appStyle/assets_images.dart';
import '../../widgets/action_button.dart';


// ignore: must_be_immutable
class StartScreenView extends StatelessWidget {
  const StartScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartScreenController>(
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(AssetsBase.backgroundImage,fit: BoxFit.cover,height: MediaQuery.of(context).size.height,width: double.infinity),
                Padding(
                  padding: AppDimensions.padding20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: AppDimensions.fifty),
                      Image.asset(AssetsBase.streamSurgName,width: MediaQuery.of(context).size.width/2),
                      // SizedBox(height: AppDimensions.forty),
                       Text.rich(
                        TextSpan(
                          children: [
                             TextSpan(text: AppStrings.uniteWithYour,
                              style: AppThemeStyles.whiteBold43
                            ),
                            TextSpan(text: AppStrings.friendsRelatives,style: AppThemeStyles.redBold43
                            ),
                            TextSpan(text: AppStrings.andHaveGreatTime,
                              style: AppThemeStyles.whiteBold43
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(height: AppDimensions.forty),
                      Column(
                        children: [
                          ActionButtonWidget(
                            onTap:(){
                              AppRouteMaps.goToLoginPage();
                            },
                             text: AppStrings.login
                          ),
                          SizedBox(height: AppDimensions.thirty),
                          InkWell(
                            onTap:(){
                              AppRouteMaps.goToLoginPage();
                            },
                            child: Container(
                              height: AppDimensions.fifty,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppDimensions.fifty),
                                  color: AppColors.whiteColor,
                                  boxShadow:  [
                                    BoxShadow(
                                      color: AppColors.blackColor.withOpacity(0.3), //color of shadow
                                      spreadRadius: 4, //spread radius
                                      blurRadius: 7, // blur radius
                                      offset: const Offset(0, 2),
                                    )
                                  ]
                              ),
                              child: Center(
                                child: Text(AppStrings.signUp,style: AppThemeStyles.blackMedium16
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // SizedBox(height: AppDimensions.forty),
                      Center(child: InkWell(
                        onTap: (){
                          AppRouteMaps.goToDashBoard();

                        },
                          child: Text(AppStrings.continueWithoutLogin,style: AppThemeStyles.whiteLightUnderLine16))),
                    ],
                  ),
                )

              ],
            )

          );
        }
    );
  }

}

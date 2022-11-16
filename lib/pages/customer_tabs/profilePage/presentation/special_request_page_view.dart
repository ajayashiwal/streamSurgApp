import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/special_request_page_controller.dart';

import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../appStyle/assets_images.dart';
import '../../../../utils/app_strings.dart';


// ignore: must_be_immutable
class SpecialRequestPageView extends StatelessWidget {
  const SpecialRequestPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialRequestPageController>(
        builder: (controller) {
          return Scaffold(
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
                title: Text(AppStrings.specialRequest,style: AppThemeStyles.black18,),
                centerTitle: true,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: AppDimensions.padding20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.requestList,style: AppThemeStyles.blackLightBold18),
                    SizedBox(height: AppDimensions.twenty),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Dancing Event",style: AppThemeStyles.black16,),
                                Text("On June 17, 2022",style: AppThemeStyles.black14,),
                                SizedBox(height: AppDimensions.ten),
                                Container(
                                  height: AppDimensions.twentyFive,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppDimensions.eight),
                                    color: AppColors.greenColor
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: AppDimensions.margin0_10_10_0,
                                      child: Text("Approved",style: AppThemeStyles.black12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: AppDimensions.ten),
                            Container(
                                color: Colors.red,
                                child: Image.asset(AssetsBase.newEventImage,height: AppDimensions.sixty,width: AppDimensions.eighty,fit: BoxFit.cover,)),

                          ],
                        ),
                        SizedBox(height: AppDimensions.ten),
                        Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1),
                        SizedBox(height: AppDimensions.ten),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sports Event",style: AppThemeStyles.black16,),
                                Text("On June 17, 2022",style: AppThemeStyles.black14,),
                                SizedBox(height: AppDimensions.ten),
                                Container(
                                  height: AppDimensions.twentyFive,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(AppDimensions.eight),
                                      color: AppColors.greyLightColor.withOpacity(0.5)
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: AppDimensions.margin0_10_10_0,

                                      child: Text("Request Pending",style: AppThemeStyles.black12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: AppDimensions.ten),
                            Container(
                                color: Colors.red,
                                child: Image.asset(AssetsBase.newEventImage,height: AppDimensions.sixty,width: AppDimensions.eighty,fit: BoxFit.cover,)),

                          ],
                        ),
                        SizedBox(height: AppDimensions.ten),
                        Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1),
                        SizedBox(height: AppDimensions.ten),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Club Event",style: AppThemeStyles.black16,),
                                Text("On June 17, 2022",style: AppThemeStyles.black14,),
                                SizedBox(height: AppDimensions.ten),
                                Container(
                                  height: AppDimensions.twentyFive,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(AppDimensions.eight),
                                      color: AppColors.orangeColor.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: AppDimensions.margin0_10_10_0,

                                      child: Text("Not Approved",style: AppThemeStyles.black12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: AppDimensions.ten),
                            Container(
                                color: Colors.red,
                                child: Image.asset(AssetsBase.newEventImage,height: AppDimensions.sixty,width: AppDimensions.eighty,fit: BoxFit.cover,)),

                          ],
                        ),
                        SizedBox(height: AppDimensions.ten),
                        Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1),
                        SizedBox(height: AppDimensions.ten),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Dancing Event",style: AppThemeStyles.black16,),
                                Text("On June 17, 2022",style: AppThemeStyles.black14,),
                                SizedBox(height: AppDimensions.ten),
                                Container(
                                  height: AppDimensions.twentyFive,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(AppDimensions.eight),
                                      color: AppColors.greenColor
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: AppDimensions.margin0_10_10_0,
                                      child: Text("Approved",style: AppThemeStyles.black12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: AppDimensions.ten),
                            Container(
                                color: Colors.red,
                                child: Image.asset(AssetsBase.newEventImage,height: AppDimensions.sixty,width: AppDimensions.eighty,fit: BoxFit.cover,)),

                          ],
                        ),
                        SizedBox(height: AppDimensions.ten),
                        Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1),
                        SizedBox(height: AppDimensions.ten),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Sports Event",style: AppThemeStyles.black16,),
                                Text("On June 17, 2022",style: AppThemeStyles.black14,),
                                SizedBox(height: AppDimensions.ten),
                                Container(
                                  height: AppDimensions.twentyFive,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(AppDimensions.eight),
                                      color: AppColors.greyLightColor.withOpacity(0.5)
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: AppDimensions.margin0_10_10_0,

                                      child: Text("Request Pending",style: AppThemeStyles.black12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: AppDimensions.ten),
                            Container(
                                color: Colors.red,
                                child: Image.asset(AssetsBase.newEventImage,height: AppDimensions.sixty,width: AppDimensions.eighty,fit: BoxFit.cover,)),

                          ],
                        ),
                        SizedBox(height: AppDimensions.ten),
                        Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1),
                        SizedBox(height: AppDimensions.ten),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Club Event",style: AppThemeStyles.black16,),
                                Text("On June 17, 2022",style: AppThemeStyles.black14,),
                                SizedBox(height: AppDimensions.ten),
                                Container(
                                  height: AppDimensions.twentyFive,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppDimensions.eight),
                                    color: AppColors.orangeColor.withOpacity(0.3),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: AppDimensions.margin0_10_10_0,

                                      child: Text("Not Approved",style: AppThemeStyles.black12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: AppDimensions.ten),
                            Container(
                                color: Colors.red,
                                child: Image.asset(AssetsBase.newEventImage,height: AppDimensions.sixty,width: AppDimensions.eighty,fit: BoxFit.cover,)),

                          ],
                        ),
                        SizedBox(height: AppDimensions.ten),
                        Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1),
                        SizedBox(height: AppDimensions.ten),




                      ],
                    ),


                  ],
                ),
              ),
            ),

          );
        }
    );
  }

}

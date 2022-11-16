import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/customer_support_page_controller.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../appStyle/assets_images.dart';
import '../../../../utils/app_strings.dart';


// ignore: must_be_immutable
class CustomerSupportPageView extends StatelessWidget {
  const CustomerSupportPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerSupportPageController>(
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
                title: Text(AppStrings.customerSupport,style: AppThemeStyles.black18,),
                centerTitle: true,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: AppDimensions.padding20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.hiHowCanWeHelpYou,style: AppThemeStyles.blackLightBold18),
                    SizedBox(height: AppDimensions.twenty),
                    Container(
                      height: AppDimensions.forty,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimensions.ten),
                          color: AppColors.greyLightColor.withOpacity(0.1)
                      ),
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        decoration:  InputDecoration(
                            contentPadding:  EdgeInsets.symmetric(horizontal: AppDimensions.twelve,vertical: AppDimensions.six),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: AppStrings.searchEvent,
                            hintStyle:  AppThemeStyles.greyLight14
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.twenty),
                    Text(AppStrings.faq,style: AppThemeStyles.blackLightBold18),
                    SizedBox(height: AppDimensions.twenty),
                    Text(AppStrings.howToJoinEvent,style: AppThemeStyles.blackLight18),
                    SizedBox(height: AppDimensions.ten),
                    Text("Lorem ipsum dolor sit amet, adipiscing elit, sed do eiusmod tempo sdfds ",style: AppThemeStyles.greyLight14),
                    SizedBox(height: AppDimensions.ten),
                    Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1),
                    SizedBox(height: AppDimensions.ten),
                    Text(AppStrings.howCanICreateMyEvent,style: AppThemeStyles.blackLight18),
                    SizedBox(height: AppDimensions.ten),
                    Text("Lorem ipsum dolor sit amet, adipiscing elit, sed do eiusmod tempo sdfds ",style: AppThemeStyles.greyLight14),
                    SizedBox(height: AppDimensions.ten),
                    Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1),
                    SizedBox(height: AppDimensions.ten),
                    Text(AppStrings.howCanPeopleLikeMyEvent,style: AppThemeStyles.blackLight18),
                    SizedBox(height: AppDimensions.ten),
                    Text("Lorem ipsum dolor sit amet, adipiscing elit, sed do eiusmod tempo sdfds ",style: AppThemeStyles.greyLight14),
                    SizedBox(height: AppDimensions.ten),
                    Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1),
                    SizedBox(height: AppDimensions.fifty),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimensions.ten),
                          color: AppColors.greyLightColor.withOpacity(0.1)
                      ),
                      child: Padding(
                        padding: AppDimensions.padding20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppStrings.customerSupport,style: AppThemeStyles.blackLightBold18),
                            SizedBox(height: AppDimensions.twenty),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.email_outlined,color: AppColors.blackColor,size: AppDimensions.twenty),
                                SizedBox(width: AppDimensions.ten),
                                Text("Email Address",style: AppThemeStyles.blackLight18),

                              ],
                            ),
                            SizedBox(height: AppDimensions.five),

                            Text("customersupport@gmail.com",style: AppThemeStyles.greyLight14),
                            SizedBox(height: AppDimensions.five),

                            Text("streamsurge@gmail.com",style: AppThemeStyles.greyLight14),
                            SizedBox(height: AppDimensions.twenty),
                            Row(
                              children: [
                                Icon(Icons.call,color: AppColors.blackColor,size:AppDimensions.twenty),
                                SizedBox(width: AppDimensions.ten),
                                Text("Mobile Number",style: AppThemeStyles.blackLight18),

                              ],
                            ),
                            SizedBox(height: AppDimensions.five),

                            Text("+91 4456745348",style: AppThemeStyles.greyLight14),
                            SizedBox(height: AppDimensions.five),

                            Text("+01 8794359023",style: AppThemeStyles.greyLight14),






                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.fifty),

                  ],
                ),
              ),
            ),

          );
        }
    );
  }

}

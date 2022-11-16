import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/createEventPage/controllers/show_new_event_details_page_controllerdart.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../appStyle/assets_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../../widgets/action_button.dart';


// ignore: must_be_immutable
class ShowNewEventDetailsPageView extends StatelessWidget {
  const ShowNewEventDetailsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowNewEventDetailsPageController>(
        builder: (controller) {
          return  Scaffold(
              backgroundColor: AppColors.whiteColor,
              resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                preferredSize:  Size.fromHeight(AppDimensions.fifty),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: AppColors.whiteColor,
                  leading:Padding(
                    padding: AppDimensions.padding15,
                    child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Image.asset(AssetsBase.clearIcon,height: AppDimensions.twenty,width: AppDimensions.twenty)),
                  ) ,
                  title: Text(AppStrings.createNewEvent,style: AppThemeStyles.black18,),
                  centerTitle: true,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: AppDimensions.padding20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.photo,style: AppThemeStyles.blackLight16),
                      SizedBox(height: AppDimensions.twenty),
                      Padding(
                        padding: AppDimensions.margin0_20_20_0,
                        child: Center(
                            child: Container(
                              height: AppDimensions.hundred,
                              decoration:  BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: controller.imageUrl==""?const AssetImage(AssetsBase.newEventImage) as ImageProvider: FileImage(File(controller.imageUrl))
                                  )
                              ),
                            )),
                      ),
                      SizedBox(height: AppDimensions.twenty),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.eventTitle,style: AppThemeStyles.blackLight16),
                          SizedBox(height: AppDimensions.five),
                          Text(controller.title,style: AppThemeStyles.black16),
                        ],
                      ),
                      Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1,),
                      SizedBox(height: AppDimensions.twenty),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.eventDes,style: AppThemeStyles.blackLight16),
                          SizedBox(height: AppDimensions.five),
                          Text(controller.titleDes,style: AppThemeStyles.black16),
                        ],
                      ),
                      Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1,),
                      SizedBox(height: AppDimensions.twenty),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.location,style: AppThemeStyles.blackLight16),
                          SizedBox(height: AppDimensions.five),
                          Text(controller.location,style: AppThemeStyles.black16),
                        ],
                      ),
                      Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1,),
                      SizedBox(height: AppDimensions.twenty),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.eventStartDate,style: AppThemeStyles.blackLight16),
                          SizedBox(height: AppDimensions.five),
                          Text(controller.startDate,style: AppThemeStyles.black16),
                        ],
                      ),
                      Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1,),
                      SizedBox(height: AppDimensions.twenty),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.eventEndDate,style: AppThemeStyles.blackLight16),
                          SizedBox(height: AppDimensions.five),
                          Text(controller.endDate,style: AppThemeStyles.black16),
                        ],
                      ),
                      Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1,),
                      SizedBox(height: AppDimensions.twenty),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.eventTime,style: AppThemeStyles.blackLight16),
                          SizedBox(height: AppDimensions.five),
                          Text(controller.time,style: AppThemeStyles.black16),
                        ],
                      ),
                      Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1,),
                      SizedBox(height: AppDimensions.twenty),
                      ActionButtonWidget(
                          onTap: (){},
                          text: AppStrings.save
                      )
                    ],
                  ),
                ),
              )

          );
        }
    );
  }

}

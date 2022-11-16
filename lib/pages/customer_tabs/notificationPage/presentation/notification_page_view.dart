import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/notificationPage/controllers/notification_page_controller.dart';
import 'package:streamsurg/pages/customer_tabs/notificationPage/presentation/notification_page_model.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../utils/app_strings.dart';


// ignore: must_be_immutable
class NotificationPageView extends StatelessWidget {
   NotificationPageView({Key? key}) : super(key: key);
  var dsh = Get.isRegistered<NotificationPageController>()
      ? Get.find<NotificationPageController>()
      : Get.put(NotificationPageController());
  @override
  Widget build(BuildContext context) {
    dsh.onInit();
    return GetBuilder<NotificationPageController>(
        builder: (controller) {
          return  Scaffold(
              backgroundColor: AppColors.whiteColor,
              resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                preferredSize:  Size.fromHeight(AppDimensions.fifty),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: AppColors.whiteColor,
                  title: Text(AppStrings.notifications,style: AppThemeStyles.black18),
                  centerTitle: true,
                ),
              ),
            body: RefreshIndicator(
              color: AppColors.orangeColor,
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.separated(
                        controller: controller.scrollController,
                        itemCount: controller.seeMore==true?notificationPageModel.length:6,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        separatorBuilder: (_,index){
                          return const Divider();
                        },
                        itemBuilder: (context,i){
                          return Padding(
                            padding:  EdgeInsets.only(bottom: AppDimensions.five,top: AppDimensions.five),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(AppDimensions.twenty),
                                child: Image.asset(notificationPageModel[i].image,height: AppDimensions.fifty),
                              ),
                              title: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text:  notificationPageModel[i].name,style: AppThemeStyles.blackMedium14),
                                    TextSpan(
                                      text: notificationPageModel[i].type,
                                      style: AppThemeStyles.black14
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: Text(notificationPageModel[i].date,style: AppThemeStyles.blackLight12,),
                            ),
                          );
                        }),
                    SizedBox(height: AppDimensions.ten),
                    controller.seeMore==true?Container():InkWell(
                      onTap: (){
                        controller.seeMore=true;
                        controller.update();
                      },
                        child: Text(AppStrings.seeMore,style: AppThemeStyles.black16))
                  ],
                ),
              ),
            ),

          );
        }
    );
  }

}

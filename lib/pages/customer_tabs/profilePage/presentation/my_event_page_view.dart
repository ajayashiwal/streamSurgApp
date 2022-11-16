import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:streamsurg/appStyle/assets_images.dart';
import 'package:streamsurg/navigation/app_route_maps.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/my_event_page_controller.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../utils/app_strings.dart';


// ignore: must_be_immutable
class MyEventPageView extends StatelessWidget {
   MyEventPageView({Key? key}) : super(key: key);
  var dsh = Get.isRegistered<MyEventPageController>()
      ? Get.find<MyEventPageController>()
      : Get.put(MyEventPageController());
  @override
  Widget build(BuildContext context) {
    dsh.onInit();
    return GetBuilder<MyEventPageController>(
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
                  title: Text(AppStrings.myEvents,style: AppThemeStyles.black18,),
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

                        itemCount: controller.seeMore==true?10:4,
                        shrinkWrap: true,
                        separatorBuilder: (context, i) {
                          return const Divider(height:1);
                        },
                        itemBuilder:(context,i){
                        return Slidable(
                          key: const ValueKey(1),
                          startActionPane:  ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.2,
                            children: [
                              SlidableAction(
                                onPressed: (_) {
                                },
                                borderRadius: BorderRadius.zero,
                                backgroundColor:AppColors.whiteColor,
                                foregroundColor: AppColors.blackColor,
                                icon: CupertinoIcons.delete,
                              ),
                              SlidableAction(
                                onPressed: (_) {
                                },
                                borderRadius: BorderRadius.zero,
                                backgroundColor:AppColors.whiteColor,
                                foregroundColor: AppColors.blackColor,
                                icon: Icons.edit,
                              ),
                            ],
                          ),
                          endActionPane:  ActionPane(
                            motion: const ScrollMotion(),
                            extentRatio: 0.2,
                            children: [
                              SlidableAction(
                                onPressed: (_) {
                                },
                                spacing: 10,
                                padding: EdgeInsets.zero,
                                backgroundColor: AppColors.whiteColor,
                                foregroundColor: AppColors.blackColor,
                                icon: CupertinoIcons.delete,
                              ),
                              SlidableAction(
                                onPressed: (_) {
                                },
                                spacing: 10,
                                padding: EdgeInsets.zero,
                                backgroundColor: AppColors.whiteColor,
                                foregroundColor: AppColors.blackColor,
                                icon:Icons.edit,
                              ),
                            ],
                          ), child: InkWell(
                          onTap: (){
                            AppRouteMaps.goToEventDetailsPage();
                          },
                            child: Padding(
                            padding: AppDimensions.padding20,
                              child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        color: Colors.red,
                                        child: Image.asset(AssetsBase.newEventImage,height: AppDimensions.fiftyFive,width: AppDimensions.eighty,fit: BoxFit.cover,)),
                                    SizedBox(width: AppDimensions.ten),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(AppStrings.newEvent,style: AppThemeStyles.black16,),
                                        Text(AppStrings.byRainbowFoundation,style: AppThemeStyles.black14,),
                                      ],
                                    )

                                  ],
                                ),
                                SizedBox(height: AppDimensions.five),
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo ",style: AppThemeStyles.greyLight14),
                                SizedBox(height: AppDimensions.ten),
                                Text("Published on June 17, 2022",style: AppThemeStyles.black14,),

                              ],
                        ),
                            ),
                          ),
                        );
                        } ),
                    SizedBox(height: AppDimensions.ten),
                    controller.seeMore==true?Container():InkWell(
                        onTap: (){
                          controller.seeMore=true;
                          controller.update();
                        },
                        child: Text("See more",style: AppThemeStyles.black16))
                  ],
                ),
              ),
            )

          );
        }
    );
  }

}

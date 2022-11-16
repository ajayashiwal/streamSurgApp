import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/join_events_page_controller.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../appStyle/assets_images.dart';
import '../../../../utils/app_strings.dart';


// ignore: must_be_immutable
class JoinEventPageView extends StatelessWidget {
  const JoinEventPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinEventPageController>(
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
                title: Text(AppStrings.joinedEvents,style: AppThemeStyles.black18,),
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
                          return InkWell(
                          onTap: (){},
                          child: Padding(
                            padding: AppDimensions.padding20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(AppStrings.newEvent,style: AppThemeStyles.black16,),
                                        Text(AppStrings.byRainbowFoundation,style: AppThemeStyles.black14,),

                                        SizedBox(height: AppDimensions.ten),
                                        Text("Published on June 17, 2022",style: AppThemeStyles.black14,),
                                      ],
                                    ),
                                    SizedBox(width: AppDimensions.ten),

                                    Container(
                                        color: Colors.red,
                                        child: Image.asset(AssetsBase.newEventImage,height: AppDimensions.sixty,width: AppDimensions.eighty,fit: BoxFit.cover,)),

                                  ],
                                ),
                                SizedBox(height: AppDimensions.ten),

                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo ",style: AppThemeStyles.greyLight16),

                              ],
                            ),
                          ),
                          );
                        } ),
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

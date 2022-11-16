import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/appStyle/app_theme_styles.dart';
import 'package:streamsurg/appStyle/assets_images.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/events_details_page_controller.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../utils/app_strings.dart';

class EventDetailsPageView extends StatelessWidget {
  const EventDetailsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailsPageController>(
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                Stack(
                  children: [
                    Image.asset(AssetsBase.homeDetailsBackImage,fit: BoxFit.fill),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: AppDimensions.margin50_20_20_20,
                        child: PopupMenuButton(
                            color: AppColors.whiteColor,
                            padding: EdgeInsets.zero,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child:  Icon(Icons.menu,color: AppColors.blackColor,size: AppDimensions.thirty),
                            ),
                            itemBuilder: (context) =>[
                              PopupMenuItem(
                                  onTap: (){
                                    if (kDebugMode) {
                                      print("Edit");
                                    }
                                  },
                                  child: Container(
                                    height: AppDimensions.forty,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(AppDimensions.two),
                                        color: const Color(0xffFDE9E5)
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: AppDimensions.thirty,right: AppDimensions.thirty),
                                        child: Text("Edit",style: AppThemeStyles.black14),
                                      ),
                                    ),
                                  )
                              ),

                              PopupMenuItem(
                                  onTap: (){
                                    if (kDebugMode) {
                                      print("Delete");
                                    }
                                  },
                                  child: Container(
                                    height: AppDimensions.forty,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(AppDimensions.two),
                                        color: const Color(0xffFDE9E5)
                                    ),
                                    child: Center(
                                      child: Text("Delete",style: AppThemeStyles.black14),
                                    ),
                                  )
                              ),
                              PopupMenuItem(
                                  onTap: (){
                                    if (kDebugMode) {
                                      print("Cancel");
                                    }

                                  },
                                  child: Container(
                                    height: AppDimensions.forty,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(AppDimensions.two),
                                        color: const Color(0xffFDE9E5)
                                    ),
                                    child: Center(
                                      child: Text("Cancel",style: AppThemeStyles.black14),
                                    ),
                                  )
                              )
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3.2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius:  BorderRadius.only(
                          topRight: Radius.circular(AppDimensions.thirty),
                          topLeft: Radius.circular(AppDimensions.thirty),
                        ),
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: const Offset(0, 2),
                          )
                        ]
                    ),
                    child:ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children: [
                        SizedBox(height: AppDimensions.twenty),
                        Center(child: Text("New Concert, Delhi",style: AppThemeStyles.blackLightBold18)),
                        SizedBox(height: AppDimensions.ten),
                        Center(child: Text("by Rainbow foundation",style: AppThemeStyles.black14)),
                        SizedBox(height: AppDimensions.twenty),
                        const Divider(color: AppColors.greyLightColor,thickness: 0.5,height: 2,),
                        SizedBox(height: AppDimensions.twenty),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                    onTap:(){
                                      controller.isInterested=!controller.isInterested;
                                      controller.update();
                                    },
                                    child: controller.isInterested==true?Image.asset(AssetsBase.thumbIcon,height: AppDimensions.thirty,color: AppColors.darkBlueColor):Image.asset(AssetsBase.thumbIcon,height: AppDimensions.thirty)),
                                SizedBox(height: AppDimensions.five),
                                Text(AppStrings.interested,style: AppThemeStyles.blackLightColor14),
                                Text("178",style: AppThemeStyles.red14)
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                    onTap:(){
                                      controller.isGoing=!controller.isGoing;
                                      controller.update();
                                    },
                                    child: controller.isGoing==true?Image.asset(AssetsBase.checkIcon,height: AppDimensions.thirty,color: AppColors.darkBlueColor):Image.asset(AssetsBase.checkIcon,height: AppDimensions.thirty)),
                                SizedBox(height: AppDimensions.five),
                                Text(AppStrings.going,style: AppThemeStyles.blackLightColor14),
                                Text("97",style: AppThemeStyles.red14)
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                    onTap:(){
                                      controller.isRating=!controller.isRating;
                                      controller.update();
                                    },
                                    child: controller.isRating==true?Image.asset(AssetsBase.starIcon,height: AppDimensions.thirty,color: AppColors.darkBlueColor):Image.asset(AssetsBase.starIcon,height: AppDimensions.thirty)),
                                SizedBox(height: AppDimensions.five),
                                Text(AppStrings.rating,style: AppThemeStyles.blackLightColor14),
                                Text("97",style: AppThemeStyles.red14)
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: AppDimensions.padding20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: AppDimensions.padding20,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: AppDimensions.forty,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.watch_later_outlined,size: AppDimensions.twentyFive,color: const Color(0xff6F6F6F)),
                                          SizedBox(width: AppDimensions.ten),
                                          const VerticalDivider(color: AppColors.greyLightColor,width: 2,thickness: 1),
                                          SizedBox(width: AppDimensions.ten),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Mon, September15, 2022",style: AppThemeStyles.blackMedium14,),
                                              Text("11:00 PM - 04:30PM",style: AppThemeStyles.blackMedium14,),

                                            ],
                                          )

                                        ],
                                      ),
                                    ),
                                    SizedBox(height: AppDimensions.twenty),
                                    SizedBox(
                                      height: AppDimensions.forty,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.location_on_outlined,size: AppDimensions.twentyFive,color: const Color(0xff6F6F6F)),
                                          SizedBox(width: AppDimensions.ten),
                                          const VerticalDivider(color: AppColors.greyLightColor,width: 2,thickness: 1),
                                          SizedBox(width: AppDimensions.ten),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Get Direction ",style: AppThemeStyles.blackMedium14,),
                                              Text("Newhall Dharmshala, Dhaka",style: AppThemeStyles.blackMedium14,),

                                            ],
                                          )

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: AppDimensions.twenty),
                              Text(AppStrings.eventDetail,style: AppThemeStyles.blackLightBold18),
                              SizedBox(height: AppDimensions.twenty),
                              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore vsriemf hlkjoi tenmgi dehimb fdghj Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore vsriemf hlkjoi tenmgi dehimb  ",style: AppThemeStyles.greyLight16),
                              SizedBox(height: AppDimensions.twenty),
                              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore vsriemf hlkjoi tenmgi dehimb fdghj Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore vsriemf hlkjoi tenmgi dehimb  ",style: AppThemeStyles.greyLight16),
                              SizedBox(height: AppDimensions.twenty),
                              Divider(color: AppColors.greyLightColor,thickness: 0.5,height: AppDimensions.two),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                )

              ],
            ),

          );

        });
  }

}

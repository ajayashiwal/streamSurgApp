import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/appStyle/app_theme_styles.dart';
import 'package:streamsurg/appStyle/assets_images.dart';
import 'package:streamsurg/navigation/app_route_maps.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/controllers/home_page_details_controller.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../utils/app_strings.dart';
import '../../../../widgets/action_button.dart';

class HomePageDetailsView extends StatelessWidget {
  const HomePageDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageDetailsController>(
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height/2,
                    child: Image.asset(AssetsBase.homeDetailsBackImage,fit: BoxFit.fill)),
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
                              SizedBox(height: AppDimensions.twenty),
                              ActionButtonWidget(
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
                                                AppStrings.areYouSure,
                                                style: AppThemeStyles.black14,
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                AppStrings.youWantToJoin,
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
                                                          Get.back();
                                                          AppRouteMaps.goToNearByEventPage();

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
                                text: AppStrings.joinEvent,
                              ),
                              SizedBox(height: AppDimensions.twenty),
                              Center(child: Text(AppStrings.interested,style: AppThemeStyles.blackLightBold18)),
                              SizedBox(height: AppDimensions.ten),
                              Center(child: Text(AppStrings.notInterested,style: AppThemeStyles.blackLightBold18)),
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

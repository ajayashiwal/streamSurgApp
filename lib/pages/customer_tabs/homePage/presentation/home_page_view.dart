import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/appStyle/app_colors.dart';
import 'package:streamsurg/appStyle/assets_images.dart';
import 'package:streamsurg/navigation/app_route_maps.dart';
import 'package:streamsurg/pages/customer_tabs/dashboard_bar/dashboard_bar_binding.dart';
import 'package:streamsurg/pages/customer_tabs/dashboard_bar/dashboard_bar_view.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/controllers/home_page_controller.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/presentation/home_page_model.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/presentation/rating_page.dart';
import 'package:streamsurg/utils/app_strings.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';


// ignore: must_be_immutable
class HomePageView extends StatelessWidget {
   HomePageView({Key? key}) : super(key: key);
  var dsh = Get.isRegistered<HomePageController>()
      ? Get.find<HomePageController>()
      : Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    dsh.onInit();
    return GetBuilder<HomePageController>(
        builder: (controller) {
          return  Scaffold(
            resizeToAvoidBottomInset: false,
              backgroundColor: AppColors.whiteColor,
              body: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.0, 0.5],
                          colors: [
                            AppColors.orangeColor.withOpacity(0.3),
                            AppColors.whiteColor
                          ],
                        )
                    ),
                  ),
                  Padding(
                    padding: AppDimensions.padding20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppDimensions.twenty),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: AppDimensions.five),
                                    Text("Hi Gurdeep",style: AppThemeStyles.black16,),
                                  ],
                                ),
                                SizedBox(height: AppDimensions.ten),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on_outlined,size: AppDimensions.twenty,color: const Color(0xff6F6F6F)),
                                    Text("349 Hickory Ridge Drive",style: AppThemeStyles.black14,),
                                  ],
                                )
                              ],
                            ),
                            InkWell(
                              onTap: (){
                                Get.offAll(() => DashBoardBarView(
                                  isSelected: 4,
                                ),
                                  binding: DashBoardPageBinding(),
                                  transition: Transition.fadeIn,
                                );
                              },
                              child: Container(
                                height: AppDimensions.forty,
                                  width: AppDimensions.forty,
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(AppDimensions.hundred)
                                  ),
                                  child: Image.asset(AssetsBase.profileHomePageIcon)),
                            )

                          ],
                        ),
                        SizedBox(height: AppDimensions.twenty),
                        Row(
                          children: [
                            Container(
                              height: AppDimensions.forty,
                              width: MediaQuery.of(context).size.width/1.7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppDimensions.ten),
                                  color: AppColors.whiteColor
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
                             SizedBox(width: AppDimensions.ten),
                            Expanded(
                              child: Container(
                                height: AppDimensions.forty,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppDimensions.ten),
                                    color: AppColors.whiteColor
                                ),
                                child: Padding(
                                  padding: AppDimensions.padding8,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      underline: Container(
                                        width: double.infinity,
                                        height: 0.8,
                                        color: AppColors.whiteColor
                                      ),
                                      hint:   Text(AppStrings.music,style: AppThemeStyles.greyLight14),
                                      icon: Image.asset(AssetsBase.downIcon,height: AppDimensions.thirteen,width: AppDimensions.thirteen),
                                      value: controller.selectedLocation,
                                      onChanged: (newValue) {
                                        controller.selectedLocation = newValue as String?;
                                        controller.update();
                                      },
                                      items: controller.locations.map((location) {
                                        return DropdownMenuItem(
                                          value: location,
                                          child: Text(location,style: const TextStyle(
                                              color: AppColors.greyLightColor
                                          )),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: AppDimensions.twenty),
                        Expanded(
                          child: RefreshIndicator(
                            color: AppColors.orangeColor,
                            onRefresh: () async {
                              await Future.delayed(const Duration(seconds: 2));
                            },
                            child: ListView.builder(
                              controller: controller.scrollController,
                              itemCount: homepageModel.length,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemBuilder: (context,i){
                                return Padding(
                                  padding:  EdgeInsets.only(bottom: AppDimensions.twenty),
                                  child: InkWell(
                                    onTap: (){
                                      AppRouteMaps.goToHomePageDetails();
                                    },
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(AppDimensions.ten),
                                          child: Image.asset(homepageModel[i].image,height: AppDimensions.oneThirty,width: double.infinity,),
                                        ),
                                        SizedBox(height: AppDimensions.ten),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: AppDimensions.twentyFive,
                                              width: AppDimensions.eighty,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(AppDimensions.eight),
                                                color: AppColors.orangeColor.withOpacity(0.1),
                                              ),
                                              child: Center(
                                                child: Text(homepageModel[i].type,style: AppThemeStyles.orange12),
                                              ),
                                            ),
                                            StarRating(
                                              rating: double.parse(homepageModel[i].rating),
                                              // onRatingChanged: (rating) => setState(() => this.rating = rating),
                                            )
                                          ],
                                        ),
                                        Text(homepageModel[i].name,style: AppThemeStyles.blackLight18),
                                        SizedBox(height: AppDimensions.ten),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.location_on_outlined,size: AppDimensions.fifTeen,color: const Color(0xff6F6F6F)),
                                            SizedBox(width: AppDimensions.five),
                                            Text(homepageModel[i].location,style: AppThemeStyles.black14,),
                                          ],
                                        ),
                                        SizedBox(height: AppDimensions.five),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Icon(Icons.watch_later_outlined,size: AppDimensions.fifTeen,color: const Color(0xff6F6F6F)),
                                            SizedBox(width: AppDimensions.five),
                                            Text(homepageModel[i].publishedDate,style: AppThemeStyles.black14,),
                                          ],
                                        )


                                      ],

                                    ),
                                  ),
                                );
                                }),
                          ),
                        ),
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

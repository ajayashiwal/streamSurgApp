import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/favoritePage/controllers/favorite_page_controller.dart';
import '../../../../appStyle/assets_images.dart';
import '../../../../appstyle/app_colors.dart';
import '../../../../appstyle/app_dimensions.dart';
import '../../../../appstyle/app_theme_styles.dart';
import '../../../../utils/app_strings.dart';


// ignore: must_be_immutable
class FavoritePageView extends StatelessWidget {
   FavoritePageView({Key? key}) : super(key: key);
  var dsh = Get.isRegistered<FavoritePageController>()
      ? Get.find<FavoritePageController>()
      : Get.put(FavoritePageController());
  @override
  Widget build(BuildContext context) {
    dsh.onInit();
    return GetBuilder<FavoritePageController>(
        builder: (controller) {
          return  Scaffold(
              backgroundColor: AppColors.whiteColor,
              resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                preferredSize:  Size.fromHeight(AppDimensions.fifty),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: AppColors.whiteColor,
                  title: Text(AppStrings.favoriteEvents,style: AppThemeStyles.black18,),
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
                                padding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                           SizedBox(height: AppDimensions.ten),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(AppStrings.newEvent,style: AppThemeStyles.black16,),
                                                  Text(AppStrings.byRainbowFoundation,style: AppThemeStyles.black14,),
                                                  Text("Published on June 17, 2022",style: AppThemeStyles.black14,),
                                                ],
                                              ),
                                              SizedBox(width: AppDimensions.ten),
                                              Image.asset(AssetsBase.newEventImage,height: AppDimensions.sixty,width: AppDimensions.eighty,fit: BoxFit.cover,),
                                            ],
                                          ),
                                          SizedBox(height: AppDimensions.five),
                                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo ",style: AppThemeStyles.greyLight14),
                                        ],
                                      ),
                                    ),
                                     SizedBox(width: AppDimensions.five),
                                    const Align(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.favorite,color: AppColors.redColor)),
                                  ],
                                ),
                              ),
                            );
                          } ),
                      // SizedBox(height: AppDimensions.ten),
                      controller.seeMore==true?Container():InkWell(
                          onTap: (){
                            controller.seeMore=true;
                            controller.update();
                          },
                          child: Text(AppStrings.seeMore,style: AppThemeStyles.black16))
                    ],
                  ),
                ),
              )

          );
        }
    );
  }

}

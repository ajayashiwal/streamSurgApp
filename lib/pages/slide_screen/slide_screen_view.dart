import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/appStyle/app_theme_styles.dart';
import 'package:streamsurg/appStyle/assets_images.dart';
import 'package:streamsurg/navigation/app_route_maps.dart';
import 'package:streamsurg/pages/slide_screen/circle_percent_indicator.dart';
import 'package:streamsurg/pages/slide_screen/slide_screen_controller.dart';
import 'package:streamsurg/pages/slide_screen/slide_screen_model.dart';
import 'package:streamsurg/utils/app_strings.dart';
import '../../appStyle/app_colors.dart';
import '../../appStyle/app_fonts.dart';
import '../../appstyle/app_dimensions.dart';


class SlideScreenView extends StatelessWidget {
  const SlideScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SlideScreenController>(
        builder: (controller) {
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(AssetsBase.backgroundImage,fit: BoxFit.cover,height: MediaQuery.of(context).size.height,width: double.infinity,),
                PageView.builder(
                  controller: controller.controller,
                  scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    controller.onPageChanged(index);
                  },
                  itemBuilder: (_, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: AppDimensions.ten,top: AppDimensions.fifty),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap:(){
                                AppRouteMaps.goToStartPage();
                              },
                                child: Text(AppStrings.skip,style: TextStyle(
                                    color: AppColors.whiteColor.withOpacity(0.8),
                                    fontFamily: AppFonts.appArticoCufonMediumFontFamily,
                                    fontSize: AppDimensions.sixTeen
                                ))),
                          ),
                        ),
                        if (contents[i].image.isNotEmpty)
                          Image.asset(contents[i].image,fit: BoxFit.contain,height: MediaQuery.of(context).size.height/2.2),
                        Padding(
                          padding: AppDimensions.margin0_20_20_0,
                          child: Text(
                            contents[i].name,
                            style: AppThemeStyles.whiteBold24,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: AppDimensions.margin0_20_20_0,
                          child: Text(
                            contents[i].des,
                            style: TextStyle(
                              fontFamily: AppFonts.appCretypeArticoCondensedLightFontFamily,
                              fontSize: AppDimensions.sixTeen,
                              color: AppColors.whiteColor,
                              height: 1.5
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            if (controller.currentIndex == contents.length - 1) {
                              AppRouteMaps.goToStartPage();
                            }
                            controller.controller.nextPage(
                                duration: const Duration(milliseconds: 10),
                                curve: Curves.bounceIn);

                          },
                          child: CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 2.0,
                            percent: controller.pagePercent,
                            center: Padding(
                                padding: AppDimensions.padding8,
                                child: Container(
                                  height: AppDimensions.sixty,
                                  width: AppDimensions.sixty,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightGreenColor,
                                      gradient:  const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Color.fromRGBO(180, 199, 231, 1),
                                          Color.fromRGBO(169, 209, 142, 1),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(AppDimensions.hundred)

                                  ),
                                  child:  Padding(
                                    padding: AppDimensions.padding8,
                                    child: Icon(Icons.arrow_forward,color: AppColors.whiteColor,size: AppDimensions.forty),
                                  ),
                                )
                            ),
                            backgroundColor: Colors.transparent,
                            linearGradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(180, 199, 231, 1),
                                Color.fromRGBO(169, 209, 142, 1),
                              ],
                              stops: [0.0, 1.0],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimensions.twenty)
                      ],
                    );
                  },
                )
              ],
            ),
          );
        });
  }
}

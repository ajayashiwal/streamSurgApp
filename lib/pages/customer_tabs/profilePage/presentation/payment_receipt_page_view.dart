import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:streamsurg/appStyle/app_fonts.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/payment_receipt_page_controller.dart';
import 'package:streamsurg/utils/app_strings.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../appStyle/assets_images.dart';
import 'package:map_launcher/map_launcher.dart' as ml;



// ignore: must_be_immutable
class PaymentReceiptPageView extends StatelessWidget {
  const PaymentReceiptPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentReceiptPageController>(
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
                title: Text(AppStrings.ticket,style: AppThemeStyles.black18,),
                centerTitle: true,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: AppDimensions.padding20,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(AssetsBase.ticketImage,height: AppDimensions.oneEighty,width: double.infinity,),
                        Positioned(
                          bottom: 0,left: 0,
                          child: Padding(
                            padding: AppDimensions.margin0_10_10_0,
                            child: Text("Marshmello, Toronto",style: TextStyle(
                              color: AppColors.whiteColor,
                              fontFamily: AppFonts.appArticoCufonMediumFontFamily,
                              fontSize: AppDimensions.eighteen
                            ),),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: AppDimensions.twenty),
                    Container(
                      // height: MediaQuery.of(context).size.height/2,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AssetsBase.backImage),
                        )
                          // gradient: LinearGradient(
                          //   begin: Alignment.centerLeft,
                          //   end: Alignment.centerRight,
                          //   stops: const [0.0, 0.5],
                          //   colors: [
                          //     AppColors.orangeColor.withOpacity(0.1),
                          //     AppColors.whiteColor
                          //   ],
                          // )
                      ),
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
                                    Text(AppStrings.location1,style: AppThemeStyles.blackLight18),
                                    Text("Toronto, ON, Canada",style: AppThemeStyles.red16),
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                                    ml.MapLauncher.showDirections(mapType: ml.MapType.google, destination: ml.Coords(19.018255973653343, 72.84793849278007),);
                                    },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.redColor
                                      ),
                                    ),
                                    child: Padding(
                                      padding: AppDimensions.margin5_10_10_5,
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_on_outlined,size: AppDimensions.twenty,color:AppColors.redColor),
                                          Text(AppStrings.map,style: AppThemeStyles.black14,),
                                        ],
                                      ),
                                    ),

                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: AppDimensions.twenty),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppStrings.dateTime,style: AppThemeStyles.blackLight18),
                                Text("13 May, 2022 10:30PM",style: AppThemeStyles.red16),
                              ],
                            ),
                            SizedBox(height: AppDimensions.twenty),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppStrings.ticketNumber,style: AppThemeStyles.blackLight18),
                                Text("BKDT-45, BKDT-46",style: AppThemeStyles.red16),
                              ],
                            ),
                            SizedBox(height: AppDimensions.twenty),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppStrings.barCode,style: AppThemeStyles.blackLight18),
                                SizedBox(height: AppDimensions.ten),

                                SizedBox(
                                  height: AppDimensions.hundred,
                                  child: SfBarcodeGenerator(
                                    value: '',
                                    symbology: Code39(),
                                    showValue: false,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: AppDimensions.twenty),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap:(){
                                      share("https://streamsurgapp.page.link/2qXj","");
                                    },
                                    child: Container(
                                      height: AppDimensions.forty,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.redColor
                                        ),
                                      ),
                                      child: Padding(
                                        padding: AppDimensions.margin5_10_10_5,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(AppStrings.shareNow,style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
                                                fontSize: AppDimensions.sixTeen
                                            ),),
                                            Icon(Icons.share,size: AppDimensions.twenty,color:AppColors.redColor),

                                          ],
                                        ),
                                      ),

                                    ),
                                  ),
                                ),
                                SizedBox(width: AppDimensions.twenty),
                                Expanded(
                                  child: Container(
                                    height: AppDimensions.forty,

                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.redColor
                                      ),
                                    ),
                                    child: Padding(
                                      padding: AppDimensions.margin5_10_10_5,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(AppStrings.download,style: TextStyle(
                                              color: AppColors.blackColor,
                                              fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
                                              fontSize: AppDimensions.sixTeen
                                          )),
                                          Icon(Icons.file_download_outlined,size: AppDimensions.twenty,color:AppColors.redColor),

                                        ],
                                      ),
                                    ),

                                  ),
                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),

          );
        }
    );
  }
  Future<void> share(dynamic link,String title)async{
    await FlutterShare.share(
      title: "Property",
      text: title,
      linkUrl: link,
      chooserTitle: "Where You Want to Share",

    );
  }
}

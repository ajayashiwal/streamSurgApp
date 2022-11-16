import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/controllers/payment_booking_page_controller.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../appStyle/assets_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../../widgets/action_button.dart';


// ignore: must_be_immutable
class PaymentBookingPageView extends StatelessWidget {
  const PaymentBookingPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentBookingPageController>(
        builder: (controller) {
          return Scaffold(
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
                title: Text(AppStrings.bookingPayment,style: AppThemeStyles.black18,),
                centerTitle: true,
              ),
            ),
            body: Padding(
              padding: AppDimensions.padding20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text(AppStrings.payment,style: AppThemeStyles.blackLightBold18)),
                  SizedBox(height: AppDimensions.twenty),
                  Text(AppStrings.totalPrice,style: AppThemeStyles.blackLightBold18),
                  SizedBox(height: AppDimensions.ten),
                  Text("\$${534.67}",style: AppThemeStyles.orangeLightBold18),
                  SizedBox(height: AppDimensions.ten),
                  Text("5% vat Included",style: AppThemeStyles.black14),
                  SizedBox(height: AppDimensions.ten),
                  Text(AppStrings.paymentMethod,style: AppThemeStyles.blackLightBold18),
                  SizedBox(height: AppDimensions.forty),
                  CardFormField(
                    enablePostalCode: true,
                    autofocus: true,
                    dangerouslyUpdateFullCardDetails: true,
                    dangerouslyGetFullCardDetails: true,
                    style: CardFormStyle(
                      textColor: Colors.black,
                      fontSize: 20,
                      backgroundColor: AppColors.whiteColor,
                      borderColor: Colors.black,
                      cursorColor: Colors.black,
                      placeholderColor: Colors.grey,
                      textErrorColor: Colors.red
                    ),
                  ),
                  SizedBox(height: AppDimensions.forty),
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
                                    AppStrings.congratulations,
                                    style: AppThemeStyles.black14,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: AppDimensions.ten),
                                  Text(
                                    AppStrings.ticketDetailsSendToYouEmail,
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
                                              showDialog(
                                                  context: context,
                                                  builder:(_)=>AlertDialog(
                                                    content: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          children:  [
                                                            const Icon(Icons.check_circle_outline,color: Colors.green,size: 25,),
                                                            SizedBox(width: AppDimensions.five),
                                                            Text("Payment Successfully",style: AppThemeStyles.black18)
                                                          ],
                                                        )

                                                      ],
                                                    ),
                                                  ) );
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
                                              showDialog(
                                                  context: context,
                                                  builder:(_)=>AlertDialog(
                                                    content: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Row(
                                                          children:  [
                                                            const Icon(Icons.check_circle_outline,color: Colors.green,size: 25,),
                                                            SizedBox(width: AppDimensions.five),
                                                            Text("Payment Successfully",style: AppThemeStyles.black18)
                                                          ],
                                                        )

                                                      ],
                                                    ),
                                                  ) );
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
                    text: "Pay Now",
                  ),
                  SizedBox(height: AppDimensions.twenty),
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
                      child: Text(AppStrings.cancel,style: AppThemeStyles.blackLightBold18)),
                ],
              ),
            ),

          );
        }
    );
  }

}

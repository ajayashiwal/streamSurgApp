import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:streamsurg/appStyle/assets_images.dart';
import 'package:streamsurg/pages/otp_Page/otp_page_controller.dart';
import '../../appStyle/app_colors.dart';
import '../../appStyle/app_dimensions.dart';
import '../../appStyle/app_fonts.dart';
import '../../appStyle/app_theme_styles.dart';
import '../../navigation/app_route_maps.dart';
import '../../utils/app_strings.dart';
import '../../widgets/action_button.dart';


// ignore: must_be_immutable
class OtpPageView extends StatelessWidget {
  const OtpPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpPageController>(
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
                  padding: AppDimensions.padding10,
                  child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Image.asset(AssetsBase.backIcon,height: AppDimensions.twenty,width: AppDimensions.twenty)),
                ) ,
              ),
            ),
            body: Padding(
              padding: AppDimensions.margin0_20_20_20,
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimensions.twenty),
                    Text(AppStrings.verifyPhoneNo,style: AppThemeStyles.blackLight24),
                    SizedBox(height: AppDimensions.twenty),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: AppStrings.oneTimePasswordDes,
                              style: AppThemeStyles.blackLight16
                          ),
                          TextSpan(text: "+91-${controller.otp}",style: AppThemeStyles.black16
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppDimensions.twenty),
                    Text(AppStrings.oneTimePassword,style: AppThemeStyles.blackLight16),
                    SizedBox(height: AppDimensions.forty),
                    PinCodeTextField(
                      length: 4,
                      controller: controller.pinController,
                      appContext: context,
                      // autoFocus: true,
                      obscureText: false,
                      enablePinAutofill: true,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(AppDimensions.ten),
                          fieldHeight: AppDimensions.fifty,
                          fieldWidth: AppDimensions.fiftyFive,
                          activeFillColor: Colors.transparent,
                          inactiveFillColor: Colors.transparent,
                          selectedFillColor: Colors.transparent,
                          activeColor: AppColors.blackColor,
                          disabledColor:AppColors.blackColor.withOpacity(0.6),
                          selectedColor: controller.hasError ? AppColors.redColor : AppColors.blackColor.withOpacity(0.6),
                          errorBorderColor: AppColors.redColor,
                          inactiveColor:
                          controller.hasError ? AppColors.redColor: AppColors.blackColor.withOpacity(0.6),
                          borderWidth: 1
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      inputFormatters: const [],
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {},
                      onChanged: (value) {
                        if(controller.pinController.text.length==4){
                          AppRouteMaps.goToRegisterPage();
                        }else{
                          Container();
                        }
                      },
                      beforeTextPaste: (text) => true,
                    ),
                    SizedBox(height: AppDimensions.twenty),
                    Center(child: Text(controller.timerText,style: AppThemeStyles.blackLight16)),
                    SizedBox(height: AppDimensions.forty),
                    ActionButtonWidget(
                        onTap: (){
                          controller.speechToText.isNotListening ? controller.startListening : controller.stopListening;

                          // if(controller.pinController.text.length<4){
                          //   ToastManager.errorToast(AppStrings.pleaseEnterVerificationCode);
                          // }else{
                          //   AppRouteMaps.goToRegisterPage();
                          //
                          // }
                        },
                        text: AppStrings.verifyCode
                    ),
                    const Spacer(),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: AppStrings.havingProblem,
                                style: AppThemeStyles.blackLight12
                            ),
                            TextSpan(text: AppStrings.sendCodeAgain,style: TextStyle(
                                color: AppColors.darkBlueColor,
                                fontFamily: AppFonts.appArticoCufonMediumFontFamily,
                                fontSize: AppDimensions.twelve,
                              decoration: TextDecoration.underline,
                            )
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.twenty),
                  ],
                ),
              ),
            ),

          );
        }
    );
  }

}

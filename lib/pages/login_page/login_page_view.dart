import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/appStyle/app_colors.dart';
import 'package:streamsurg/appStyle/app_fonts.dart';
import 'package:streamsurg/navigation/app_route_maps.dart';
import 'package:streamsurg/pages/login_page/county_code_picker.dart';
import 'package:streamsurg/pages/login_page/login_page_controller.dart';
import '../../appStyle/app_dimensions.dart';
import '../../appStyle/app_theme_styles.dart';
import '../../appStyle/assets_images.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import '../../utils/app_strings.dart';
import '../../widgets/action_button.dart';



// ignore: must_be_immutable
class LoginPageView extends StatelessWidget {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetsBase.streamSurgName,width: MediaQuery.of(context).size.width/2),
                    SizedBox(height: AppDimensions.ten),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.getStarted,style: AppThemeStyles.blackLight24),
                        SizedBox(height: AppDimensions.twenty),
                        Text(AppStrings.phoneDes,style: AppThemeStyles.blackLight14),
                        SizedBox(height: AppDimensions.twenty),
                        Text(AppStrings.phoneNumber,style: AppThemeStyles.greyLight16),
                        SizedBox(height: AppDimensions.twenty),
                        SizedBox(
                          height: AppDimensions.seventy,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: AppDimensions.oneThirty,
                                height: AppDimensions.fiftyFive,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CountryCodePicker(
                                      padding: EdgeInsets.zero,
                                      showDropDownButton: true,
                                      onChanged: (val) {
                                        // _controller.countryCode = val.toString();
                                      },
                                      flagWidth: AppDimensions.twenty,
                                      hideMainText: false,
                                      showFlagMain: true,
                                      showFlag: true,
                                      textStyle: AppThemeStyles.black16,
                                      initialSelection: 'US',
                                      favorite: const ['+1', 'US'],
                                      hideSearch: false,
                                      showCountryOnly: false,
                                      showOnlyCountryWhenClosed: false,
                                      alignLeft: true,
                                    ),
                                    // SizedBox(height: AppDimensions.two),
                                    Container(
                                        height: AppDimensions.one,
                                        color: AppColors.greyLightColor
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: AppDimensions.ten),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: controller.phoneNoController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      MaskedInputFormatter('000-000-0000'),
                                    ],
                                    style: AppThemeStyles.black16,
                                    cursorColor: AppColors.blackColor,
                                    decoration:  InputDecoration(
                                      // border: InputBorder.none,
                                        enabledBorder:  UnderlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                                        ),
                                        focusedBorder:  UnderlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                                        ),
                                      hintText: AppStrings.phoneNumber,
                                      hintStyle:  AppThemeStyles.greyLight14
                                    ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppStrings.pleaseEnterPhoneNo;
                                    } else if(value.replaceAll("-", "").length<10){
                                      return AppStrings.pleaseEnterValidPhoneNo;
                                    } {
                                        return null;
                                      }

                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppDimensions.ten),
                        Text(AppStrings.password1,style: TextStyle(
                            fontSize: AppDimensions.sixTeen,
                            fontFamily: AppFonts.appCretypeArticoNormalFontFamily,
                            color: AppColors.greyLightColor
                        ),),
                        TextFormField(
                          controller: controller.passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.blackColor,
                          obscuringCharacter: "*",
                          style: AppThemeStyles.black16,
                          obscureText: controller.isObscure,
                          decoration: InputDecoration(
                              hintText: AppStrings.password,
                              hintStyle:  AppThemeStyles.greyLight14,
                              enabledBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                              ),
                              focusedBorder:  UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                              ),

                              suffixIcon: IconButton(
                                icon: Icon(controller.isObscure
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off,color: AppColors.greyLightColor),
                                onPressed: () {
                                  controller.isObscure = !controller.isObscure;
                                  controller.update();

                                },
                              )),
                          validator: (value) {
                            RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            if (value!.isEmpty) {
                              return AppStrings.pleaseEnterPassword;
                            } else {
                              if (!regex.hasMatch(value)) {
                                return AppStrings.passwordValidationDes;
                              } else {
                                return null;
                              }
                            }
                          },
                        ),
                        SizedBox(height: AppDimensions.twenty),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(AppStrings.forgotPassword,style: AppThemeStyles.orangeUnderLine14)),
                      ],
                    ),
                    SizedBox(height: AppDimensions.twenty),
                    Column(
                      children: [
                        ActionButtonWidget(
                            onTap: (){
                              if(controller.formKey.currentState?.validate()??true){
                                AppRouteMaps.goToOtpPage(controller.phoneNoController.text.replaceAll("-", ""));
                              }
                            },
                            text: AppStrings.sendOtp
                        ),
                        SizedBox(height: AppDimensions.twenty),
                        Center(
                          child: Text(AppStrings.or,style: AppThemeStyles.greyLight18),),
                        SizedBox(height: AppDimensions.twenty),

                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  controller.signInFb(context);
                                },
                                child: Container(
                                  height: AppDimensions.fifty,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppDimensions.fifty),
                                    color: AppColors.lightBlueColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AssetsBase.fbIcon,height: AppDimensions.eighteen),
                                      SizedBox(width: AppDimensions.ten),
                                      Text(AppStrings.faceBook,style: AppThemeStyles.whiteMedium18
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: AppDimensions.twenty),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  controller.googleSignIn();
                                },
                                child: Container(
                                  height: AppDimensions.fifty,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppDimensions.fifty),
                                    color: AppColors.whiteColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AssetsBase.googleIcon,height: AppDimensions.eighteen),
                                      SizedBox(width: AppDimensions.ten),
                                      Text(AppStrings.google,style: AppThemeStyles.darkGreyMedium18
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: AppDimensions.twenty),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }


}

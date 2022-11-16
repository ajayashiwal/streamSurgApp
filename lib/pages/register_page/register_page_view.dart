import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/register_page/register_page_controller.dart';
import '../../appStyle/app_colors.dart';
import '../../appStyle/app_dimensions.dart';
import '../../appStyle/app_theme_styles.dart';
import '../../appStyle/assets_images.dart';
import '../../navigation/app_route_maps.dart';
import '../../utils/app_strings.dart';
import '../../widgets/action_button.dart';
import '../../widgets/image_picker_bottom_sheet.dart';


// ignore: must_be_immutable
class RegisterPageView extends StatelessWidget {
  const RegisterPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPageController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
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
            body: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Padding(
                  padding: AppDimensions.margin0_20_20_20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: AppDimensions.twenty),
                      Text(AppStrings.buildYourProfile,style: AppThemeStyles.blackLight24),
                      SizedBox(height: AppDimensions.twenty),
                      Text(AppStrings.profileDes,style: AppThemeStyles.blackLight16),
                      SizedBox(height: AppDimensions.forty),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: InkWell(
                                onTap: (){
                                  showModalBottomSheet(
                                      context: context,
                                      builder: ((builder) => ImagePickerClass.bottomSheet(controller)));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                        radius: AppDimensions.fifty,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: controller.imageFile==null ?  const AssetImage(AssetsBase.profileImage):FileImage(File(controller.imageFile!.path)) as ImageProvider
                                    ),
                                    SizedBox(height: AppDimensions.ten),
                                    Text(AppStrings.uploadPhoto,style: AppThemeStyles.blackLight14),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: AppColors.blackColor,
                        obscuringCharacter: "*",
                        style: AppThemeStyles.black16,
                        decoration: InputDecoration(
                            label:  Text(AppStrings.name),
                            labelStyle: AppThemeStyles.blackLight16,
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                          ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.pleaseEnterName;
                          }  else {
                              return null;
                            }

                        },
                      ),
                      SizedBox(height: AppDimensions.ten),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: AppColors.blackColor,
                        obscuringCharacter: "*",
                        style: AppThemeStyles.black16,
                        decoration: InputDecoration(
                            label:  Text(AppStrings.emailAddress),
                            labelStyle: AppThemeStyles.blackLight16,
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.pleaseEnterEmail;
                          } else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                            return AppStrings.pleaseEnterValidEmail;
                          }else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: AppDimensions.twenty),
                      Text(AppStrings.gender,style: AppThemeStyles.greyLight16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 1,
                                activeColor: AppColors.orangeColor,
                                groupValue: controller.gender,
                                onChanged: (value) {
                                  controller.gender = value as int?;
                                  controller.update();
                                },
                              ),
                               Text(
                                AppStrings.male,
                                style: AppThemeStyles.black16,

                              ),
                          ],),
                           SizedBox(width: AppDimensions.twenty),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 2,
                                activeColor: AppColors.orangeColor,
                                groupValue: controller.gender,
                                onChanged: (value) {
                                  controller.gender = value as int?;
                                  controller.update();
                                },
                              ),
                               Text(
                                AppStrings.female,
                                 style: AppThemeStyles.black16,
                              ),
                            ],
                          ),
                          SizedBox(width: AppDimensions.twenty),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 3,
                                activeColor: AppColors.orangeColor,
                                groupValue: controller.gender,
                                onChanged: (value) {
                                  controller.gender = value as int?;
                                  controller.update();
                                },
                              ),
                               Text(
                                AppStrings.other,
                                 style: AppThemeStyles.black16,

                              ),
                            ],
                          )

                        ],
                      ),
                      SizedBox(height: AppDimensions.ten),
                      Text(AppStrings.selectState,style: AppThemeStyles.greyLight16),
                      Container(
                        width: double.infinity,
                        height: AppDimensions.fifty,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppDimensions.five)
                        ),
                        child: DropdownButton(
                          isExpanded: true,
                          underline: Container(
                            width: double.infinity,
                            height: 0.8,
                            color: AppColors.blackColor.withOpacity(0.4)
                          ),
                          hint:  Text(AppStrings.selectState,style: AppThemeStyles.black16),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          iconDisabledColor: const Color.fromRGBO(76, 73, 73, 0.6),
                          value: controller.selectedLocation,
                            onChanged: (newValue) {
                              controller.selectedLocation = newValue as String?;
                              controller.update();
                            },
                            items: controller.locations.map((location) {
                              return DropdownMenuItem(
                                value: location,
                                child: Text(location,style: AppThemeStyles.black16),
                              );
                            }).toList(),
                        ),
                      ),
                      SizedBox(height: AppDimensions.ten),

                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: controller.passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: AppColors.blackColor,
                        obscuringCharacter: "*",
                        style: AppThemeStyles.black16,
                        obscureText: controller.isObscurePassword,
                        decoration: InputDecoration(
                            labelText: AppStrings.password,
                            labelStyle:  AppThemeStyles.blackLight16,
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),

                            suffixIcon: IconButton(
                              icon: Icon(controller.isObscurePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off,color: AppColors.greyLightColor),
                              onPressed: () {
                                controller.isObscurePassword = !controller.isObscurePassword;
                                controller.update();

                              },
                            )),
                        validator: (value) {
                          controller.confirmPass = value;
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
                      SizedBox(height: AppDimensions.ten),
                      TextFormField(
                        controller: controller.confirmPasswordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: AppColors.blackColor,
                        obscuringCharacter: "*",
                        style: AppThemeStyles.black16,
                        obscureText: controller.isObscureConfirmPassword,
                        decoration: InputDecoration(
                            labelText: AppStrings.confirmPassword,
                            labelStyle:  AppThemeStyles.blackLight16,
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),

                            suffixIcon: IconButton(
                              icon: Icon(controller.isObscureConfirmPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off,color: AppColors.greyLightColor),
                              onPressed: () {
                                controller.isObscureConfirmPassword = !controller.isObscureConfirmPassword;
                                controller.update();

                              },
                            )),
                        validator: (value) {
                          RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return AppStrings.pleaseEnterConfirmPassword;
                          } else {
                            if (!regex.hasMatch(value)) {
                              return AppStrings.passwordValidationDes;
                            } else if (value != controller.confirmPass) {
                              return AppStrings.passwordMustBeSameAsAbove;
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                      SizedBox(height: AppDimensions.forty),
                      ActionButtonWidget(
                          onTap:(){
                            if(controller.formKey.currentState?.validate()??true){
                              AppRouteMaps.goToDashBoard();
                            }
                            },
                          text: AppStrings.register
                      )
                    ]
                )
          ),
              ),
            ),


          );
        }
    );
  }
}

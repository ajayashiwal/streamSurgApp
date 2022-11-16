import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/controllers/edit_profile_page_controller.dart';

import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../appStyle/assets_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../../widgets/action_button.dart';
import '../../../../widgets/image_picker_bottom_sheet.dart';

class EditProfilePageView extends StatelessWidget {
  const EditProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfilePageController>(
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
                title: Text(AppStrings.editProfile,style: AppThemeStyles.black18,),
                centerTitle: true,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: AppDimensions.padding20,
                child: Column(
                  children: [
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
                              child: CircleAvatar(
                                radius: AppDimensions.fifty,
                                backgroundColor: Colors.transparent,
                                child: Stack(
                                  children: [

                                    Align(
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                          radius: AppDimensions.fifty,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: controller.imageFile==null ?  const AssetImage(AssetsBase.profileImage):FileImage(File(controller.imageFile!.path)) as ImageProvider
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                        radius: AppDimensions.sixTeen,
                                        backgroundColor: const Color.fromRGBO(236, 231, 231, 1),
                                        child: Image.asset(AssetsBase.editIcon,height: AppDimensions.twenty,width: AppDimensions.twenty),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: AppDimensions.ten),
                    Text("Marry Martin",style: AppThemeStyles.blackLightBold18),
                    SizedBox(height: AppDimensions.ten),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(AppStrings.name1,style:AppThemeStyles.black16),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.blackColor,
                          style: AppThemeStyles.black16,
                          decoration: InputDecoration(
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimensions.ten),
                        Text(AppStrings.age,style:AppThemeStyles.black16),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.blackColor,
                          style: AppThemeStyles.black16,
                          keyboardType:TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly

                          ],

                          decoration: InputDecoration(

                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),

                          ),

                        ),
                        SizedBox(height: AppDimensions.ten),
                        Text(AppStrings.gender,style: AppThemeStyles.black16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

                          ],
                        ),
                        SizedBox(height: AppDimensions.ten),
                        Text(AppStrings.email,style:AppThemeStyles.black16),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType:TextInputType.emailAddress,

                          cursorColor: AppColors.blackColor,
                          style: AppThemeStyles.black16,
                          decoration: InputDecoration(
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                          ),
                        ),
                        SizedBox(height: AppDimensions.ten),
                        Text(AppStrings.location1,style:AppThemeStyles.black16),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.blackColor,
                          style: AppThemeStyles.black16,
                          decoration: InputDecoration(
                            enabledBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blackColor.withOpacity(0.4)), //<-- SEE HERE
                            ),

                          ),

                        ),
                        SizedBox(height: AppDimensions.twenty),

                        ActionButtonWidget(
                          onTap: (){

                          },
                          text: AppStrings.save,
                        )

                      ],
                    )




                  ],
                ),
              ),
            ),


          );
        });

  }
}

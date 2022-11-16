import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/navigation/app_route_maps.dart';
import 'package:streamsurg/widgets/action_button.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/app_theme_styles.dart';
import '../../../../utils/app_strings.dart';
import '../../../../widgets/image_picker_bottom_sheet.dart';
import '../controllers/create_event_page_controller.dart';


// ignore: must_be_immutable
class CreateEventPageView extends StatelessWidget {
   CreateEventPageView({Key? key}) : super(key: key);
   var dsh = Get.isRegistered<CreateEventPageController>()
       ? Get.find<CreateEventPageController>()
       : Get.put(CreateEventPageController());
  @override

  Widget build(BuildContext context) {
    dsh.onInit();
    return GetBuilder<CreateEventPageController>(
        builder: (controller) {
          return Scaffold(
              backgroundColor: AppColors.whiteColor,
              resizeToAvoidBottomInset: false,
              appBar: PreferredSize(
                preferredSize:  Size.fromHeight(AppDimensions.fifty),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: AppColors.whiteColor,
                  title: Text(AppStrings.createNewEvent,style: AppThemeStyles.black18,),
                  centerTitle: true,
                ),
              ),
              body: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: AppDimensions.padding20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.photo,style: AppThemeStyles.blackLight16),
                        SizedBox(height: AppDimensions.twenty),
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
                                  controller.imageFile==null ?
                                  Container(
                                    height: AppDimensions.hundred,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(AppDimensions.ten),
                                        color: AppColors.greyLightColor.withOpacity(0.3)

                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.file_upload_outlined,color: AppColors.blackLightColor,size: AppDimensions.thirty),
                                        Text(AppStrings.clickHereToUpload,style: AppThemeStyles.blackLightColor16
                                        ),
                                      ],
                                    ),
                                  ):Container(
                                    height: AppDimensions.hundred,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(AppDimensions.ten),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: FileImage(File(controller.imageFile!.path))
                                        )
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(height: AppDimensions.twenty),
                        TextFormField(
                          controller: controller.titleController,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.blackColor,
                          obscuringCharacter: "*",
                          style: AppThemeStyles.black16,
                          decoration: InputDecoration(
                            label:  Text(AppStrings.eventTitle),
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
                              return AppStrings.thisFieldIsNotEmpty;
                            }  else {
                              return null;
                            }

                          },
                        ),
                        SizedBox(height: AppDimensions.twenty),
                        TextFormField(
                          controller: controller.titleDesController,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.blackColor,
                          obscuringCharacter: "*",
                          style: AppThemeStyles.black16,
                          decoration: InputDecoration(
                            label:  Text(AppStrings.eventDes),
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
                              return AppStrings.thisFieldIsNotEmpty;
                            }  else {
                              return null;
                            }

                          },
                        ),
                        SizedBox(height: AppDimensions.twenty),
                        TextFormField(
                          controller: controller.locationController,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.blackColor,
                          obscuringCharacter: "*",
                          style: AppThemeStyles.black16,
                          decoration: InputDecoration(
                            label: Row(
                              children: [
                                Icon(Icons.location_on_outlined,size: AppDimensions.twenty,color: const Color(0xff6F6F6F)),
                                Text(AppStrings.location),
                              ],
                            ),
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
                              return AppStrings.thisFieldIsNotEmpty;
                            }  else {
                              return null;
                            }

                          },

                        ),
                        SizedBox(height: AppDimensions.twenty),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppStrings.eventStartDate,style: AppThemeStyles.blackLight16),
                                    SizedBox(height: AppDimensions.five),
                                    Text(controller.startDate,style: AppThemeStyles.black16),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.selectStartDate(context);
                                  },
                                  child:  Icon(Icons.calendar_today_outlined,
                                      size: AppDimensions.twentyTwo,
                                      color: AppColors.blackColor
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1,)
                          ],
                        ),
                        SizedBox(height: AppDimensions.twenty),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppStrings.eventEndDate,style: AppThemeStyles.blackLight16),
                                    SizedBox(height: AppDimensions.five),
                                    Text(controller.endDate,style: AppThemeStyles.black16),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.selectEndDate(context);
                                  },
                                  child:  Icon(Icons.calendar_today_outlined,
                                      size: AppDimensions.twentyTwo,
                                      color: AppColors.blackColor
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1,)
                          ],
                        ),
                        SizedBox(height: AppDimensions.twenty),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppStrings.eventTime,style: AppThemeStyles.blackLight16),
                                    SizedBox(height: AppDimensions.five),
                                    Text(controller.selectedTime.format(context),style: AppThemeStyles.black16),
                                  ],
                                ),
                                InkWell(
                                  onTap: () async {
                                    controller.selectTime(context);
                                  },
                                  child:  Icon(Icons.watch_later_outlined,
                                      size: AppDimensions.twentyTwo,
                                      color: AppColors.blackColor
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: AppColors.blackColor.withOpacity(0.4),thickness: 1,)
                          ],
                        ),
                        SizedBox(height: AppDimensions.twenty),
                        ActionButtonWidget(
                          onTap: (){
                            if(controller.formKey.currentState?.validate()??true){
                              AppRouteMaps.goToNewEventDetailsPage(
                                controller.imageFile?.path??"",
                                controller.titleController.text,
                                controller.titleDesController.text,
                                controller.locationController.text,
                                controller.startDate,
                                controller.endDate,
                                controller.selectedTime.format(context),

                              );
                            }

                          },
                          text: AppStrings.continuue,
                        )
                      ],
                    ),
                  ),
                ),
              )

          );
        }
    );
  }

}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../appStyle/app_dimensions.dart';
import '../appStyle/app_theme_styles.dart';
import '../utils/app_strings.dart';

class ImagePickerClass{


  static bottomSheet(controller) {
    return Container(
      width: double.infinity,
      margin:  EdgeInsets.symmetric(horizontal: AppDimensions.ten, vertical: AppDimensions.twenty),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ignore: deprecated_member_use
          FlatButton.icon(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {
              controller.takePhoto(ImageSource.camera);
            },
            label:  Text(AppStrings.openCamera,style: AppThemeStyles.black16),
          ),
          // ignore: deprecated_member_use
          FlatButton.icon(
            icon:  const Icon(CupertinoIcons.photo_on_rectangle),
            onPressed: () {
              controller.takePhoto(ImageSource.gallery);
            },
            label:  Text(AppStrings.openGallery,style: AppThemeStyles.black16),
          ),
          SizedBox(height: AppDimensions.twenty),
          InkWell(
            onTap: (){
              Get.back();
            },
            child:  Center(
              child: Text(AppStrings.cancel,style: AppThemeStyles.black16),
            ),
          )
        ],
      ),
    );
  }



}
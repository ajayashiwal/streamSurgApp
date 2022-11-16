import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPageController extends GetxController {
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  ImagePicker? picker = ImagePicker();
  bool isObscurePassword = true;
  final formKey = GlobalKey<FormState>();
  bool isObscureConfirmPassword = true;
  PickedFile? imageFile;
  File? fileOfImage;
  int? gender = 0;
  // ignore: prefer_typing_uninitialized_variables
  var confirmPass;
  List<String> locations = ['A', 'B', 'C', 'D']; // Option 2
   String? selectedLocation;

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await picker!.getImage(source: source).whenComplete((){
      Get.back();
    });
    if(pickedFile!=null) {
      imageFile = pickedFile;
      update();
      fileOfImage = File(imageFile!.path);
    }
  }

}

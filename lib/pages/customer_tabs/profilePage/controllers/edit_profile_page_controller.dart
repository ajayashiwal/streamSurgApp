import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePageController extends GetxController {
  ImagePicker? picker = ImagePicker();

  PickedFile? imageFile;
  File? fileOfImage;
  int? gender = 0;


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

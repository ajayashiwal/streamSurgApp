import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateEventPageController extends GetxController {
  TextEditingController eventTitleController=TextEditingController();
  TextEditingController titleController=TextEditingController();
  TextEditingController titleDesController=TextEditingController();
  TextEditingController locationController=TextEditingController();
  ImagePicker? picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final formKey = GlobalKey<FormState>();



  String startDate = "";
  String endDate = "";

  PickedFile? imageFile;
  File? fileOfImage;

  @override
  void onInit() {
    startDate=DateFormat('dd-M-yyyy').format(selectedDate);
    endDate=DateFormat('dd-M-yyyy').format(selectedDate);
    super.onInit();

  }
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
  selectStartDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),

    );
    if (selected != null && selected != selectedDate)
      // ignore: curly_braces_in_flow_control_structures
      if (kDebugMode) {
        print(selected);
      }
    selectedDate = selected!;
    startDate = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
    update();

  }
  selectEndDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),

    );
    if (selected != null && selected != selectedDate)
      // ignore: curly_braces_in_flow_control_structures
      if (kDebugMode) {
        print(selected);
      }
    selectedDate = selected!;
    endDate = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
    update();

  }

  selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      selectedTime = timeOfDay;
      update();
    }
  }



}

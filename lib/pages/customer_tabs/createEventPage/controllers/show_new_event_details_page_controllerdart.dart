import 'package:get/get.dart';

class ShowNewEventDetailsPageController extends GetxController {
  var argumentData = Get.arguments;
  String imageUrl="";
  String title="";
  String titleDes="";
  String location="";
  String startDate="";
  String endDate="";
  String time="";
  @override
  void onInit() {
    imageUrl = argumentData[0]["imageUrl"];
    title = argumentData[0]["title"];
    titleDes = argumentData[0]["titleDes"];
    location = argumentData[0]["location"];
    startDate = argumentData[0]["startDate"];
    endDate = argumentData[0]["endDate"];
    time = argumentData[0]["time"];
    super.onInit();

  }

}

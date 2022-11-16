import 'package:get/get.dart';
import 'package:streamsurg/navigation/app_pages.dart';

abstract class AppRouteMaps{
  static void goToSlidePage() {
    Get.offAllNamed(
      Routes.slidePage,
    );
  }
  static void goToStartPage() {
    Get.offAllNamed(
      Routes.startPage,
    );
  }
  static void goToLoginPage() {
    Get.toNamed(
      Routes.loginPage,
    );
  }
  static void goToOtpPage(String otp) {
    Get.toNamed(
      Routes.otpPage,
      arguments: [{
        "otp":otp
      }]
    );
  }
  static void goToRegisterPage() {
    Get.toNamed(
      Routes.registerPage,
    );
  }
  static void goToDashBoard() {
    Get.offAllNamed(
      Routes.dashBoard,
    );
  }

  static void goToHomePageDetails() {
    Get.toNamed(
      Routes.homePageDetails,
    );
  }
  static void goToNearByEventPage() {
    Get.toNamed(
      Routes.nearByEventPage,
    );
  }
  static void goToCrateEventPage() {
    Get.toNamed(
      Routes.createEventPage,
    );
  }
  static void goToNewEventDetailsPage(
      String imageUrl,
      String title,
      String titleDes,
      String location,
      String startDate,
      String endDate,
      String time

      ) {
    Get.toNamed(
      Routes.newEventDetailsPage,
      arguments: [{
        "imageUrl":imageUrl,
        "title":title,
        "titleDes":titleDes,
        "location":location,
        "startDate":startDate,
        "endDate":endDate,
        "time":time
      }]
    );
  }

  static void goToMyEventPage(){
    Get.toNamed(
        Routes.myEventPage,
    );
  }
  static void goToEventDetailsPage(){
    Get.toNamed(
      Routes.eventDetailsPage,
    );
  }
  static void goToEditProfilePage(){
    Get.toNamed(
      Routes.editProfilePage,
    );
  }
  static void goToJoinEventPage(){
    Get.toNamed(
      Routes.joinEventPage,
    );
  }
  static void goToSpecialRequestPage(){
    Get.toNamed(
      Routes.specialRequestPage,
    );
  }
  static void goToCustomerSupportPage(){
    Get.toNamed(
      Routes.customerSupportPage,
    );
  }
  static void goToPaymentReceiptPage(){
    Get.toNamed(
      Routes.paymentReceiptPage,
    );
  }
  static void goToRewardsPage(){
    Get.toNamed(
      Routes.rewardsPage,
    );
  }
  static void goToPaymentBookingPage(){
    Get.toNamed(
      Routes.paymentBookingPage,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:streamsurg/appStyle/app_theme_styles.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/controllers/near_by_event_page_controller.dart';
import '../../../../appStyle/app_colors.dart';
import '../../../../appStyle/app_dimensions.dart';
import '../../../../appStyle/assets_images.dart';
import '../../../../navigation/app_route_maps.dart';
import '../../../../utils/app_strings.dart';
import '../../../../widgets/action_button.dart';

// ignore: must_be_immutable
class NearByEventPageView extends StatelessWidget {
   NearByEventPageView({Key? key}) : super(key: key);
  var dsh = Get.isRegistered<NearByEventPageDetailsController>()
      ? Get.find<NearByEventPageDetailsController>()
      : Get.put(NearByEventPageDetailsController());
  @override
  Widget build(BuildContext context) {
    dsh.onInit();
    return GetBuilder<NearByEventPageDetailsController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize:  Size.fromHeight(AppDimensions.fifty),
              child: AppBar(
                elevation: 0,
                backgroundColor: AppColors.whiteColor,
                leading:Padding(
                  padding: AppDimensions.padding15,
                  child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Image.asset(AssetsBase.clearIcon,height: AppDimensions.twenty,width: AppDimensions.twenty)),
                ) ,
                title: Text(AppStrings.events,style: AppThemeStyles.black18,),
                centerTitle: true,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: AppDimensions.padding20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.nearByEvent,style: AppThemeStyles.blackLightBold18),
                    SizedBox(height: AppDimensions.twenty),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/2.2,
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppDimensions.ten),
                        child:   GoogleMap(
                            tiltGesturesEnabled: true,
                            zoomControlsEnabled: false,
                            myLocationButtonEnabled: false,
                            myLocationEnabled: false,
                            mapToolbarEnabled: false,
                            onMapCreated: (GoogleMapController controller1) {
                              controller.controllerMap.complete(controller1);
                            },
                            markers: {
                              controller.india3Marker,
                            },

                            initialCameraPosition: const CameraPosition(target: LatLng(19.018255973653343, 72.84793849278007), zoom: 11.0, tilt: 0, bearing: 0)
                        ),
                      ),
                    ),
                    SizedBox(height: AppDimensions.twenty),

                    Text("Talk Show Mumbai",style: AppThemeStyles.blackLight18),
                    SizedBox(height: AppDimensions.twenty),
                    SizedBox(
                      height: AppDimensions.forty,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.watch_later_outlined,size: AppDimensions.twentyFive,color: const Color(0xff6F6F6F)),
                          SizedBox(width: AppDimensions.ten),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mon, September15, 2022",style: AppThemeStyles.blackMedium14,),
                              Text("11:00 PM - 04:30PM",style: AppThemeStyles.blackMedium14,),

                            ],
                          )

                        ],
                      ),
                    ),
                    SizedBox(height: AppDimensions.twenty),
                    Text(AppStrings.eventDetail,style: AppThemeStyles.blackLightBold18),
                    SizedBox(height: AppDimensions.ten),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore vsriemf hlkjoi tenmgi dehimb fdghj Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore vsriemf hlkjoi tenmgi dehimb  ",style: AppThemeStyles.greyLight16),
                    SizedBox(height: AppDimensions.twenty),
                    ActionButtonWidget(
                      onTap: (){
                        AppRouteMaps.goToPaymentBookingPage();
                      },
                      text: AppStrings.bookEvent,
                    )],
                ),
              ),
            ),
          );
        });

  }
}

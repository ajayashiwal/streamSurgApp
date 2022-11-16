import 'package:get/get.dart';
import 'package:streamsurg/pages/customer_tabs/dashboard_bar/dashboard_bar_binding.dart';
import 'package:streamsurg/pages/customer_tabs/dashboard_bar/dashboard_bar_view.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/bindings/home_page_details_binding.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/bindings/near_by_event_page_binding.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/bindings/payment_booking_page_binding.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/presentation/home_page_details_view.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/presentation/near_by_event_page_view.dart';
import 'package:streamsurg/pages/customer_tabs/homePage/presentation/payment_booking_page_view.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/bindings/customer_support_page_binding.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/bindings/events_details_page_binding.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/bindings/join_events_page_binding.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/bindings/rewards_page_binding.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/bindings/special_request_page_binding.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/presentation/customer_support_page_view.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/presentation/events_details_page_view.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/presentation/join_events_page_view.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/presentation/rewards_page_view.dart';
import 'package:streamsurg/pages/customer_tabs/profilePage/presentation/special_request_page_view.dart';
import 'package:streamsurg/pages/login_page/login_page_bindng.dart';
import 'package:streamsurg/pages/login_page/login_page_view.dart';
import 'package:streamsurg/pages/otp_Page/otp_page_binding.dart';
import 'package:streamsurg/pages/otp_Page/otp_page_view.dart';
import 'package:streamsurg/pages/register_page/register_page_binding.dart';
import 'package:streamsurg/pages/register_page/register_page_view.dart';
import 'package:streamsurg/pages/slide_screen/slide_screen_binding.dart';
import 'package:streamsurg/pages/splash_page/splash_binding.dart';
import 'package:streamsurg/pages/splash_page/splash_view.dart';
import 'package:streamsurg/pages/start_screen/start_screen_view.dart';
import '../pages/customer_tabs/createEventPage/bindings/create_event_page_binding.dart';
import '../pages/customer_tabs/createEventPage/bindings/show_new_event_details_page_binding.dart';
import '../pages/customer_tabs/createEventPage/presentation/create_event_page_view.dart';
import '../pages/customer_tabs/createEventPage/presentation/show_new_event_details_page_view.dart';
import '../pages/customer_tabs/profilePage/bindings/edit_profile_page_binding.dart';
import '../pages/customer_tabs/profilePage/bindings/my_event_page_binding.dart';
import '../pages/customer_tabs/profilePage/bindings/payment_receipt_page_binding.dart';
import '../pages/customer_tabs/profilePage/presentation/edit_profile_page_view.dart';
import '../pages/customer_tabs/profilePage/presentation/my_event_page_view.dart';
import '../pages/customer_tabs/profilePage/presentation/payment_receipt_page_view.dart';
import '../pages/slide_screen/slide_screen_view.dart';
import '../pages/start_screen/start_screen_binding.dart';
part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
/// and will be used in the material app.
/// Will be ignored for test since all are static values and would not change.
class AppPages {

  static var transitionDuration = const Duration(
    milliseconds: 250,
  );
  static const initial = Routes.splashPage;
  static final pages = [
    GetPage<dynamic>(
      name: _Paths.splashPage,
      transitionDuration: transitionDuration,
      page:  SplashView.new,
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.slidePage,
      transitionDuration: transitionDuration,
      page:  SlideScreenView.new,
      binding: SlideScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.startPage,
      transitionDuration: transitionDuration,
      page:  StartScreenView.new,
      binding: StartScreenBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.loginPage,
      transitionDuration: transitionDuration,
      page:  LoginPageView.new,
      binding: LoginPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.otpPage,
      transitionDuration: transitionDuration,
      page:  OtpPageView.new,
      binding: OtpPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.registerPage,
      transitionDuration: transitionDuration,
      page:  RegisterPageView.new,
      binding: RegisterPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.dashBoard,
      transitionDuration: transitionDuration,
      page:  DashBoardBarView.new,
      binding: DashBoardPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.homePageDetails,
      transitionDuration: transitionDuration,
      page:  HomePageDetailsView.new,
      binding: HomePageDetailsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.nearByEventPage,
      transitionDuration: transitionDuration,
      page:  NearByEventPageView.new,
      binding: NearByEventPageDetailsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.createEventPage,
      transitionDuration: transitionDuration,
      page:  CreateEventPageView.new,
      binding: CreateEventPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.newEventDetailsPage,
      transitionDuration: transitionDuration,
      page:  ShowNewEventDetailsPageView.new,
      binding: ShowNewEventDetailsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.myEventPage,
      transitionDuration: transitionDuration,
      page:  MyEventPageView.new,
      binding: MyEventPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.eventDetailsPage,
      transitionDuration: transitionDuration,
      page:  EventDetailsPageView.new,
      binding: EventDetailsPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.editProfilePage,
      transitionDuration: transitionDuration,
      page:  EditProfilePageView.new,
      binding: EditProfilePageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.joinEventPage,
      transitionDuration: transitionDuration,
      page:  JoinEventPageView.new,
      binding: JoinEventPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.specialRequestPage,
      transitionDuration: transitionDuration,
      page:  SpecialRequestPageView.new,
      binding: SpecialRequestPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.customerSupportPage,
      transitionDuration: transitionDuration,
      page:  CustomerSupportPageView.new,
      binding: CustomerSupportPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.paymentReceiptPage,
      transitionDuration: transitionDuration,
      page:  PaymentReceiptPageView.new,
      binding: PaymentReciptPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.rewardsPage,
      transitionDuration: transitionDuration,
      page:  RewardsPageView.new,
      binding: RewardsPageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<dynamic>(
      name: _Paths.paymentBookingPage,
      transitionDuration: transitionDuration,
      page:  PaymentBookingPageView.new,
      binding: PaymentBookingPageBinding(),
      transition: Transition.fadeIn,
    ),


  ];
}

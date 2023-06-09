import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/blood_pressure/blood_pressure_binding.dart';
import 'package:healthcare_app_doctor/modules/blood_pressure/blood_pressure_page.dart';
import 'package:healthcare_app_doctor/modules/bmi/bmi_binding.dart';
import 'package:healthcare_app_doctor/modules/bmi/bmi_page.dart';
import 'package:healthcare_app_doctor/modules/calendar/calendar_binding.dart';
import 'package:healthcare_app_doctor/modules/calendar/calendar_page.dart';
import 'package:healthcare_app_doctor/modules/call/call_binding.dart';
import 'package:healthcare_app_doctor/modules/call/call_page.dart';
import 'package:healthcare_app_doctor/modules/call_video/call_video_binding.dart';
import 'package:healthcare_app_doctor/modules/call_video/call_video_page.dart';
import 'package:healthcare_app_doctor/modules/change-password/change_password_binding.dart';
import 'package:healthcare_app_doctor/modules/change-password/change_password_page.dart';
import 'package:healthcare_app_doctor/modules/cholesterol/cholesterol_binding.dart';
import 'package:healthcare_app_doctor/modules/cholesterol/cholesterol_page.dart';
import 'package:healthcare_app_doctor/modules/glucose/glucose_binding.dart';
import 'package:healthcare_app_doctor/modules/glucose/glucose_page.dart';
import 'package:healthcare_app_doctor/modules/heartbeat/heartbeat_binding.dart';
import 'package:healthcare_app_doctor/modules/heartbeat/heartbeat_page.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_binding.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_page.dart';
import 'package:healthcare_app_doctor/modules/login/login_binding.dart';
import 'package:healthcare_app_doctor/modules/login/login_page.dart';
import 'package:healthcare_app_doctor/modules/main-navigation/main_navigation.dart';
import 'package:healthcare_app_doctor/modules/main-navigation/main_navigation_binding.dart';
import 'package:healthcare_app_doctor/modules/otp_pass/otp_pass_binding.dart';
import 'package:healthcare_app_doctor/modules/otp_pass/otp_pass_page.dart';
import 'package:healthcare_app_doctor/modules/personal-info/personal_info_binding.dart';
import 'package:healthcare_app_doctor/modules/personal-info/personal_info_pages.dart';
import 'package:healthcare_app_doctor/modules/personal-update/personal_update_binding.dart';
import 'package:healthcare_app_doctor/modules/personal-update/personal_update_pages.dart';
import 'package:healthcare_app_doctor/modules/phone_pass/phone_pass_binding.dart';
import 'package:healthcare_app_doctor/modules/phone_pass/phone_pass_pages.dart';
import 'package:healthcare_app_doctor/modules/reset_password/reset_password_binding.dart';
import 'package:healthcare_app_doctor/modules/reset_password/reset_password_page.dart';
import 'package:healthcare_app_doctor/modules/sign_up/sign_up_binding.dart';
import 'package:healthcare_app_doctor/modules/sign_up/sign_up_page.dart';
import 'package:healthcare_app_doctor/modules/splash/splash_binding.dart';
import 'package:healthcare_app_doctor/modules/splash/splash_page.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';

class AppPages {
  static var getPages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.SPLASH_SCREEN,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.MAIN_NAVIGATION,
      page: () => MainNavigation(),
      binding: MainNavigationBinding(),
    ),
    GetPage(
      name: AppRoutes.INFOR_PAGE,
      page: () => InforPage(),
      binding: InforBinding(),
    ),
    //   GetPage(
    //     name: AppRoutes.CHAT_PAGE,
    //     page: () => ChatPage(),
    //     binding: ChatBinding(),
    //   ),
    //  GetPage(
    //     name: AppRoutes.PERSONAL_PAGE,
    //     page: () => PersonalPage(),
    //     binding: PersonalBinding(),
    //   ),
    GetPage(
      name: AppRoutes.CALENDAR_PAGE,
      page: () => CalendarPage(),
      binding: CalendarBinding(),
    ),
    //   // GetPage(
    //   //   name: AppRoutes.MESSAGE_PAGE,
    //   //   page: () => MessagesPage(chat: ,),
    //   //   binding: MessagesBinding(),
    //   // ),
    //   GetPage(
    //     name: AppRoutes.CHAT_GPT_PAGE,
    //     page: () => ChatGPTScreen(),
    //     binding: ChatGptBinding(),
    //   ),
    // GetPage(
    //   name: AppRoutes.CALL_PAGE,
    //   page: () => CallPage(),
    //   binding: CallBinding(),
    // ),
    GetPage(
      name: AppRoutes.BLOOD_PRESSURE_PAGE,
      page: () => BloodPressurePage(),
      binding: BloodPressureBinding(),
    ),
    GetPage(
      name: AppRoutes.BMI_PAGE,
      page: () => BmiPage(),
      binding: BmiBinding(),
    ),
    GetPage(
      name: AppRoutes.HEARTBEAT_PAGE,
      page: () => HeartbeatPage(),
      binding: HeartbeatBinding(),
    ),
    GetPage(
      name: AppRoutes.CHOLESTEROL_PAGE,
      page: () => CholesterolPage(),
      binding: CholesterolBinding(),
    ),
    GetPage(
      name: AppRoutes.GLUCOSE_PAGE,
      page: () => GlucosePage(),
      binding: GlucoseBinding(),
    ),
    //   GetPage(
    //     name: AppRoutes.NOTIFICATION_PAGE,
    //     page: () => NotificationPage(),
    //     binding: NotificationBinding(),
    //   ),
    GetPage(
      name: AppRoutes.CHANGE_PASSWORD_PAGE,
      page: () => ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.PERSONAL_INFO_PAGE,
      binding: PersonalInfoBinding(),
      page: () => PersonalInfoPage(),
    ),
    GetPage(
      name: AppRoutes.CALL_PAGE,
      binding: CallBinding(),
      page: () => CallPage(),
    ),

     GetPage(
      name: AppRoutes.CALL_VIDEO_PAGE,
      binding: CallVideoBinding(),
      page: () => CallScreen(),
    ),
    GetPage(
      name: AppRoutes.PERSONAL_UPDATE_PAGE,
      binding: PersonalUpdateBinding(),
      page: () => PersonalUpdatePage(),
    ),

    GetPage(
      name: AppRoutes.PHONE_PASS_PAGE,
      binding: PhonePassBinding(),
      page: () => PhonePassPage(),
    ),

     GetPage(
      name: AppRoutes.OTP_PASS_PAGE,
      binding: OtpPassBinding(),
      page: () => OtpPassPage(),
    ),
    GetPage(
      name: AppRoutes.RESET_PASSWORD_PAGE,
      binding: ResetPasswordBinding(),
      page: () => ResetPasswordPage(),
    ),
  ];
}

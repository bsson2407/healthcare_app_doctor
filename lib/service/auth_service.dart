import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/login/login_request.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';

class AuthService extends GetxController {
  final _auth = FirebaseAuth.instance;
  var verificationId = "".obs;

  Future<void> signInWithPhoneNumber(String phone, password) async {
    String phoneNumbers = "+84${phone.substring(1)}";

    LoginRequest data = LoginRequest(phone: phone, password: password);
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumbers,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          Get.snackbar("Error", "The phone number is not valid");
        } else {
          Get.snackbar("Error", "Something went wrong. Try again ${e.code}");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        Get.toNamed(AppRoutes.OTP_PAGE, arguments: data);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

   Future<void> sendOtpPhoneNumber(String phone) async {
    String phoneNumbers = "+84${phone.substring(1)}";

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumbers,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          Get.snackbar("Error", "The phone number is not valid");
        } else {
          Get.snackbar("Error", "Something went wrong. Try again ${e.code}");
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        Get.toNamed(AppRoutes.OTP_PASS_PAGE, arguments: phone);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }
}

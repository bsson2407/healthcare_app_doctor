import 'package:healthcare_app_doctor/utils/share_pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocalStorageService extends GetxService {
  static late final SharedPreferences instance;
  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  static String getAccessToken() {
    return instance.getString(SharePrefConstant.ACCESS_TOKEN) ?? "";
  }

  static void setAccessToken(String value) async {
    instance.setString(SharePrefConstant.ACCESS_TOKEN, value);
  }

  static String getRefreshToken() {
    return instance.getString(SharePrefConstant.REFRESH_TOKEN) ?? "";
  }

  static void setRefreshToken(String value) async {
    instance.setString(SharePrefConstant.REFRESH_TOKEN, value);
  }

  static String getPhone() {
    return instance.getString(SharePrefConstant.PHONE) ?? "";
  }

  static void setPhone(String value) async {
    instance.setString(SharePrefConstant.PHONE, value);
  }

  static String getPassword() {
    return instance.getString(SharePrefConstant.PASSWORD) ?? "";
  }

  static void setPassword(String value) async {
    instance.setString(SharePrefConstant.PASSWORD, value);
  }

  static String getId() {
    return instance.getString(SharePrefConstant.ID) ?? "";
  }

  static void setId(String value) async {
    instance.setString(SharePrefConstant.ID, value);
  }

  static String getPatientId() {
    return instance.getString(SharePrefConstant.PATIENTID) ?? "";
  }

  static void setPatientId(String value) async {
    instance.setString(SharePrefConstant.PATIENTID, value);
  }

  static String getConversationId() {
    return instance.getString(SharePrefConstant.CONVERSATIONID) ?? "";
  }

  static void setConversationId(String value) async {
    instance.setString(SharePrefConstant.CONVERSATIONID, value);
  }
}

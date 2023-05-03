import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/call/call_controller.dart';
import 'package:healthcare_app_doctor/modules/call/widget/default_circle_image.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);
  // final String? callID;
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID:
            909621478, // Fill in the appID that you  get from ZEGOCLOUD Admin Console.
        appSign:
            "111b58d37fa7d7903d411169d42a0d92671455cde73e341869b65f650174c669", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: LocalStorageService.getId(),
        userName: 'patient',
        callID: LocalStorageService.getConversationCallId(),
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()
        // ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
        );
  }
}

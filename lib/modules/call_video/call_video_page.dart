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
            1643966043, // Fill in the appID that you  get from ZEGOCLOUD Admin Console.
        appSign:
            "82e5f91825f928c7d51f38617860c8a18ca36e33752c333428c84623a8d176aa", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: LocalStorageService.getId(),
        userName: 'doctor',
        callID: LocalStorageService.getConversationCallId(),
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()
        // ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
        );
  }
}

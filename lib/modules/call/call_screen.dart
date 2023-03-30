// import 'package:flutter/material.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// class CallScreen extends StatelessWidget {
//   const CallScreen({Key? key, required this.callID}) : super(key: key);
//   final String callID;
//   @override
//   Widget build(BuildContext context) {
//     return ZegoUIKitPrebuiltCall(
//       appID:
//           1646990952, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
//       appSign:
//           "b46f09ad8c3782def3f33c6224082d7e", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
//       userID: 'user_id',
//       userName: 'user_name',
//       callID: callID,
//       // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
//       config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
//         ..onOnlySelfInRoom = (context) => Navigator.of(context).pop(),
//     );
//   }
// }

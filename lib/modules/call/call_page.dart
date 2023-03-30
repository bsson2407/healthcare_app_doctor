// import 'package:flutter/material.dart';
// import 'package:healthcare_app_doctor/modules/call/call_screen.dart';

// class CallPage extends StatelessWidget {
//   CallPage({Key? key}) : super(key: key);

//    final callIDTextCtrl = TextEditingController(text: "testCallID");


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   controller: callIDTextCtrl,
//                   decoration:
//                       const InputDecoration(labelText: "start a call by id"),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) {
//                       // return CallScreen(callID: callIDTextCtrl.text);
//                     }),
//                   );
//                 },
//                 child: const Text("call"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//     // return Scaffold(
//     //   body: Center(
//     //     child: Padding(
//     //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//     //       child: Row(
//     //         mainAxisAlignment: MainAxisAlignment.center,
//     //         crossAxisAlignment: CrossAxisAlignment.center,
//     //         children: [
//     //           Expanded(
//     //             child: TextFormField(
//     //               controller: callIdController,
//     //               decoration: const InputDecoration(
//     //                 labelText: "join a call by id",
//     //               ),
//     //             ),
//     //           ),
//     //           ElevatedButton(
//     //             onPressed: () {
//     //               Navigator.push(
//     //                 context,
//     //                 MaterialPageRoute(builder: (context) {
//     //                   return CallScreen(callID: callIdController.text);
//     //                 }),
//     //               );
//     //             },
//     //             child: const Text('join'),
//     //           ),
//     //         ],
//     //       ),
//     //     ),
//     //   ),
//     // );
//   // }
// }

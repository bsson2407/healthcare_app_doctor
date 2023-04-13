import 'package:flutter/material.dart';
import 'package:healthcare_app_doctor/models/chats/chat_response.dart';
import 'package:healthcare_app_doctor/modules/messages/messages_controller.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';

class VideoMessage extends StatelessWidget {
  final DataMessageResponse message;
  final MessagesController controller = Get.put(MessagesController());

  VideoMessage({Key? key, required this.message}) : super(key: key) {
    controller.initVideoMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: controller.videoPlayerController.value.isInitialized
            ? Obx(() => Chewie(controller: controller.chewieController))
            : const CircularProgressIndicator(),
      ),
    );
  }
}







// class VideoMessage extends StatefulWidget {
//   final DataMessageResponse message;

//   const VideoMessage({Key? key, required this.message}) : super(key: key);

//   @override
//   _VideoMessageState createState() => _VideoMessageState();
// }

// class _VideoMessageState extends State<VideoMessage> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         VideoPlayerController.network(widget.message.file![0].url as String);
//     _initializeVideoPlayerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: 300,
//         height: 200,
//         child: FutureBuilder(
//           future: _initializeVideoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _controller.value.isPlaying
//                         ? _controller.pause()
//                         : _controller.play();
//                   });
//                 },
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   children: [
//                     VideoPlayer(_controller),
//                     VideoProgressIndicator(_controller, allowScrubbing: true),
//                   ],
//                 ),
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/chats/chat_response.dart';
import 'package:healthcare_app_doctor/models/chats/message_request.dart';
import 'package:healthcare_app_doctor/repository/chat.repository.dart';
import 'package:healthcare_app_doctor/service/socket_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:video_player/video_player.dart';

class MessagesController extends GetxController {
  var chatRepository = Get.find<ChatRepository>();
  var contentController = TextEditingController();
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  var isDisposed = false.obs;

  RxList<DataMessageResponse> listMessage = RxList<DataMessageResponse>([]);
  var socketService = Get.find<SocketService>();

  // @override
  @override
  void onInit() {
    super.onInit();
    socketService.socket.onConnect((data) {
      print('Connected to Socket.io server');
      socketService.socket.on('newMessage', (msg) {
        // MessageResponse msga = msg;
        // print('Received message data: ${data['data']}');
        try {
          DataMessageResponse messageResponse =
              DataMessageResponse.fromJson(msg['data']);

          listMessage.add(messageResponse);
        } catch (e) {
          print('errr: ${e}');
        }
      });
    });
  }

  void initVideoMessage(DataMessageResponse message) {
    print("123___${message.file![0].url}");
    videoPlayerController =
        VideoPlayerController.network(message.file![0].url as String);
    print("___${videoPlayerController.value.isInitialized}");
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9, // tỷ lệ khung hình của video
      autoPlay: true, // tự động phát video khi khởi động
      looping: true, // lặp lại video khi phát xong
    );
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.onClose();
  }

  void initListMessage(String id, Function onComplete) async {
    final response = await chatRepository.getMessage(id, 1, 20);

    if (response.statusCode == 200) {
      // listBmi = response.data;
      listMessage.clear();
      listMessage.addAll(response.data);
      onComplete();
    } else {
      // Xử lý khi API trả về lỗi
    }
  }

  void upload(List<XFile> files, String id, String type) async {
    try {
      if (files.isNotEmpty) {
        List<String> lst = [];
        await chatRepository.upload(files).then((value) {
          for (var val in value) {
            lst.add(val.id);
          }
        });

        await chatRepository
            .postMessage(
                id, MessageRequest(typeMessage: type, content: "", file: lst))
            .then((value) {});
        print('12345_${lst.length}');
      }
    } on DioError catch (e) {
      EasyLoading.showError(e.response?.data['message']);
    }
  }

  void postMessage(String id, String content) async {
    try {
      await chatRepository
          .postMessage(id,
              MessageRequest(typeMessage: 'TEXT', content: content, file: []))
          .then((value) {});
    } on DioError catch (e) {
      EasyLoading.showError(e.response?.data['message']);
    }
  }
}

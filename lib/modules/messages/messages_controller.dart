import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/chats/chat_response.dart';
import 'package:healthcare_app_doctor/models/chats/message_request.dart';
import 'package:healthcare_app_doctor/repository/chat.repository.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:healthcare_app_doctor/service/socket_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart';

class MessagesController extends GetxController {
  var chatRepository = Get.find<ChatRepository>();
  var contentController = TextEditingController();
  late ChewieController chewieController;
  var isDisposed = false.obs;
  final ScrollController scrollController = ScrollController();

  RxList<DataMessageResponse> listMessage = RxList<DataMessageResponse>([]);
  var socketService = Get.find<SocketService>();

  // @override
  @override
  void onInit() {
    super.onInit();

    socketService.socket.onConnect((data) {
      socketService.socket.on('newMessage', (msg) {
        // MessageResponse msga = msg;
        try {
          DataMessageResponse messageResponse =
              DataMessageResponse.fromJson(msg['data']);

          listMessage.add(messageResponse);
        } catch (e) {}
      });
    });
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

  void callVideo(String conversationId, callerId, calleeId) async {
    // socketService.socket.onConnect((data) {
    LocalStorageService.setConversationCallId(conversationId);
    LocalStorageService.setCalleeId(calleeId);
    LocalStorageService.setCallerId(callerId);

    socketService.socket.emit('call', {
      "conversationId": conversationId,
      "callerId": callerId,
      "calleeId": calleeId
    });
    Get.toNamed(AppRoutes.CALL_PAGE, arguments: false);
    // });
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
      }
    } on DioError catch (e) {
      EasyLoading.showError(e.response?.data['message']);
    }
  }

  void uploadFile(List<FilePickerResult> files, String id, String type) async {
    try {
      if (files.isNotEmpty) {
        List<String> lst = [];
        await chatRepository.uploadFile(files).then((value) {
          for (var val in value) {
            lst.add(val.id);
          }
        });

        await chatRepository
            .postMessage(
                id, MessageRequest(typeMessage: type, content: "", file: lst))
            .then((value) {});
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

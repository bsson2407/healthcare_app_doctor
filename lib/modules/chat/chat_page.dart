import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/components/filled_outline_button.dart';
import 'package:healthcare_app_doctor/modules/chat/chat_controller.dart';
import 'package:healthcare_app_doctor/modules/messages/messages_controller.dart';
import 'package:healthcare_app_doctor/modules/messages/messages_page.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';

import 'chat_card.dart';

class ChatPage extends StatelessWidget {
  var chatController = Get.find<ChatController>();
  var messagesController = Get.find<MessagesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
        title: const Text('Nhắn tin'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatController.listConversation.length,
            itemBuilder: ((context, index) => ChatCard(
                chat: chatController.listConversation[index],
                press: () => {
                      LocalStorageService.setConversationId(
                          chatController.listConversation[index].id as String),
                      messagesController.initListMessage(
                          chatController.listConversation[index].id ?? '', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessagesPage(
                                  chat:
                                      chatController.listConversation[index])),
                        );
                      })
                    })),
          ),
        )
      ]),
    );
  }
}

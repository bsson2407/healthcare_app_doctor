import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/chats/conversation_response.dart';
import 'package:healthcare_app_doctor/modules/messages/components/chat_input_fields.dart';
import 'package:healthcare_app_doctor/modules/messages/components/message.dart';
import 'package:healthcare_app_doctor/modules/messages/messages_controller.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';


class MessagesPage extends StatefulWidget {
  MessagesPage({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final DataConversationResponse chat;
  @override
  _MessagesPage createState() => _MessagesPage();
}

var messagesController = Get.find<MessagesController>();

class _MessagesPage extends State<MessagesPage> {
  DataConversationResponse? chat;

  @override
  void initState() {
    super.initState();
    chat = widget.chat;
    messagesController.listMessage;
  }

  // @override
  Widget build(BuildContext context) {
    var t = print('***${messagesController.listMessage.length}****');
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: messagesController.listMessage.length,
              itemBuilder: (context, index) =>
                  Message(message: messagesController.listMessage[index]),
            ),
          )),
          ChatInputField()
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    var user = chat?.member.firstWhere((m) => m.user?.id != id)?.user;
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: NetworkImage(
                "https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg"),
          ),
          const SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user?.fullName ?? '', style: TextStyle(fontSize: 16)),
              // Text('Active 3m ago', style: TextStyle(fontSize: 12))
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
        SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}

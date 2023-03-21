import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:healthcare_app_doctor/models/chats/chat_response.dart';
import 'package:healthcare_app_doctor/modules/messages/components/ChatMessage.dart';
import 'package:healthcare_app_doctor/modules/messages/components/text_message.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';


import 'audio_message.dart';
import 'video_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final DataMessageResponse message;
  @override
  Widget build(BuildContext context) {
  var id = LocalStorageService.getId();
  bool isSender = (message.createdBy == id) as bool;

    Widget messageContaint(DataMessageResponse message) {
      switch (message.typeMessage) {
        case 'TEXT':
          return TextMessage(message: message);
        // case 'IMAGE':
        //   return AudioMessage(message: message);
        // case 'VIDEO':
        //   return VideoMessage(message: message);
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender) ...[
            const CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(
                  "https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg"),
            ),
            const SizedBox(
              width: kDefaultPadding / 2,
            )
          ],
          messageContaint(message),
          // if (isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDot({Key? key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return kPrimaryColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: EdgeInsets.only(left: kDefaultPadding / 2),
      height: 15,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor(status!),
        shape: BoxShape.circle,
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 11,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:healthcare_app_doctor/models/chats/chat_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final DataMessageResponse message;

  @override
  Widget build(BuildContext context) {
    var id = LocalStorageService.getId();
    bool isSender = (message.createdBy == id) as bool;
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(isSender ? 1 : 0.08),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        message.content ?? '',
        style: TextStyle(
            color: isSender
                ? Colors.white
                : Theme.of(context).textTheme.bodyText1?.color),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:healthcare_app_doctor/models/chats/conversation_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChatCard extends StatelessWidget {
  ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);
  final DataConversationResponse chat;
  final VoidCallback press;
  var id = LocalStorageService.getId();

  @override
  Widget build(BuildContext context) {
    return Container(child: _cardItem(chat));
  }

  _cardItem(DataConversationResponse chat) {
    var user = chat.member.firstWhere((m) => m.user?.id != id)?.user;
    DateTime? date = chat.updatedAt;
    var inputFormat = DateFormat('dd/MM/yyyy').format(date!);

    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        height: 98.5,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0 * 0.75),
          child: Column(
            children: [
              Row(
                children: [
                  // Stack(
                  //   children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg"),
                  ),
                  // if (chat.isActive)
                  //   Positioned(
                  //     bottom: 0,
                  //     right: 0,
                  //     child: Container(
                  //       height: 16,
                  //       width: 16,
                  //       decoration: BoxDecoration(
                  //         color: kPrimaryColor,
                  //         shape: BoxShape.circle,
                  //         border: Border.all(
                  //             color: Theme.of(context).scaffoldBackgroundColor,
                  //             width: 3),
                  //       ),
                  //     ),
                  //   ),
                  //   ],
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.fullName ?? '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Opacity(
                              opacity: 0.64,
                              child: Text(
                                chat.lastMessage?.content ??
                                    "hii hasd adiwe sadasid sadashu asduahsdu asdasud adasd",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.64,
                    child: Text(inputFormat),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

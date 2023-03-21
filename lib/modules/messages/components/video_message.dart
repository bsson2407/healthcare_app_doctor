import 'package:flutter/material.dart';
import 'package:healthcare_app_doctor/modules/messages/components/ChatMessage.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';

class VideoMessage extends StatelessWidget {
  const VideoMessage({super.key, required this.message});
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: AspectRatio(
          aspectRatio: 1.6,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                    "https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg"),
              ),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
                child: Icon(
                  Icons.play_arrow,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}

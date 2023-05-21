import 'package:flutter/material.dart';
import 'package:healthcare_app_doctor/models/chats/chat_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

class FileMessage extends StatelessWidget {
  const FileMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final DataMessageResponse message;
  void openFile(String filePath) async {
    await OpenFile.open(filePath);
  }

  @override
  Widget build(BuildContext context) {
    var id = LocalStorageService.getId();
    String assets = 'assets/images/blank_icon.png';
    String name = message.file![0].name ?? "";
    bool isSender = (message.createdBy == id);
    Uri uri = Uri.parse(message.file![0].url as String);
    String filePath = uri.path;
    String fileType = '';
    if (filePath.endsWith('.pdf')) {
      assets = 'assets/images/pdf_icon.png';
      fileType = 'pdf';
    } else if (filePath.endsWith('.xls') ||
        filePath.endsWith('.xlsx') ||
        filePath.endsWith('.csv')) {
      fileType = 'xls';
      assets = 'assets/images/excel_icon.png';
    } else if (filePath.endsWith('.doc') || filePath.endsWith('.docx')) {
      assets = 'assets/images/word_icon.png';
      fileType = 'doc';
    }
    return InkWell(
      onTap: () async {
        if (await canLaunch(message.file![0].url ?? "")) {
          await launch(message.file![0].url ?? "");
        } else {
          // throw 'Không thể mở liên kết $fileUrl';
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75,
          vertical: kDefaultPadding / 2.5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor.withOpacity(isSender ? 1 : 0.1),
        ),
        child: Row(
          children: [
            // Icon(Icons.play_arrow,
            //     color: message.isSender ? Colors.white : kPrimaryColor),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Row(
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      children: List<Widget>.generate((name.length / 20).ceil(),
                          (int index) {
                        int start = index * 20;
                        int end = (index + 1) * 20;
                        if (end > name.length) {
                          end = name.length;
                        }
                        return Text(
                          name.substring(start, end),
                          softWrap: true,
                        );
                      }),
                    ),
                    Image.asset(
                      assets,
                      height: 50,
                      width: 50,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

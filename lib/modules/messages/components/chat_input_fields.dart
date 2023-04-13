import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/messages/messages_controller.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';
import 'package:image_picker/image_picker.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({Key? key}) : super(key: key);
  @override
  _ChatInputField createState() => _ChatInputField();
}

var messagesController = Get.find<MessagesController>();
var id = LocalStorageService.getConversationId();
final ImagePicker picker = ImagePicker();

class _ChatInputField extends State<ChatInputField> {
  bool isChange = false;

  @override
  void initState() {
    super.initState();
    messagesController.contentController.addListener(_handleTextFieldChanged);
  }

  @override
  void dispose() {
    messagesController.contentController
        .removeListener(_handleTextFieldChanged);
    super.dispose();
  }

  void _handleTextFieldChanged() {
    final text = messagesController.contentController.text;
    setState(() {
      isChange = text.isEmpty ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 32,
                offset: Offset(0, 4),
                color: Color(0xff087949).withOpacity(0.3))
          ]),
      child: SafeArea(
          child: Row(
        children: [
          Icon(Icons.mic, color: kPrimaryColor),
          SizedBox(width: kDefaultPadding),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.07),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.color
                        ?.withOpacity(0.64),
                  ),
                  SizedBox(width: kDefaultPadding / 2),
                  Expanded(
                    child: TextField(
                      controller: messagesController.contentController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Nhập tin nhắn'),
                    ),
                  ),
                  !isChange
                      ? Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                await selectImage();
                                // List<XFile>? images =
                                //     await picker.pickMultiImage(
                                //   imageQuality: 70,
                                //   maxWidth: 1440,
                                // );
                                // messagesController.upload(images, id);
                              },
                              child: Icon(
                                Icons.image,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color
                                    ?.withOpacity(0.64),
                              ),
                            ),
                            SizedBox(width: kDefaultPadding / 4),
                            InkWell(
                              onTap: () async {
                                await selectFile();
                              },
                              child: Icon(
                                Icons.attach_file,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color
                                    ?.withOpacity(0.64),
                              ),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            String content =
                                messagesController.contentController.text;

                            messagesController.postMessage(id, content);
                            messagesController.contentController.text = '';
                          },
                          child: Icon(
                            Icons.send,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.color
                                ?.withOpacity(0.64),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

Future<dynamic> selectImage() {
  return Get.bottomSheet(Container(
    height: 150,
    width: Get.width,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  List<XFile>? images = await picker.pickMultiImage(
                    imageQuality: 70,
                    maxWidth: 1440,
                  );
                  messagesController.upload(images, id, 'IMAGE');
                },
                child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/gallery.png",
                            height: 60,
                            width: 60,
                          ),
                          Text('Gallery'),
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () async {
                  XFile? images =
                      await picker.pickImage(source: ImageSource.camera);
                  List<XFile> arr = [];
                  arr.add(images!);
                  messagesController.upload(arr, id, 'IMAGE');
                },
                child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/camera.png",
                            height: 60,
                            width: 60,
                          ),
                          Text('Camera'),
                        ],
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}

Future<dynamic> selectFile() {
  return Get.bottomSheet(Container(
    height: 150,
    width: Get.width,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  final video =
                      await picker.pickVideo(source: ImageSource.gallery);
                  print('_+_+_+_+${video}');
                  List<XFile> arr = [];
                  arr.add(video!);
                  messagesController.upload(arr, id, 'VIDEO');
                },
                child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/video.png",
                            height: 60,
                            width: 60,
                          ),
                          Text('Video'),
                        ],
                      ),
                    )),
              ),
              GestureDetector(
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                          type: FileType.custom,
                          allowMultiple: false,
                          allowedExtensions: ['xls', 'xlsx', 'doc']);
                },
                child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/file.jpg",
                            height: 60,
                            width: 60,
                          ),
                          Text('File'),
                        ],
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}

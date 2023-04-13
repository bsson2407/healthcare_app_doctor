import 'package:flutter/material.dart';
import 'package:healthcare_app_doctor/models/chats/chat_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';

class ImageMessage extends StatelessWidget {
  // const ImageMessage({super.key, required this.message});
  const ImageMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final DataMessageResponse message;

  @override
  Widget build(BuildContext context) {
    var id = LocalStorageService.getId();
    bool isSender = (message.createdBy == id);
    int crossAxisCount;
    if (message.file!.length <= 4) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }
    return message.file!.length > 1
        ? Container(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 0.75,
                vertical: kDefaultPadding / 2),
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(isSender ? 1 : 0.08),
                borderRadius: BorderRadius.circular(30)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: kDefaultPadding / 2,
                  mainAxisSpacing: kDefaultPadding / 2,
                ),
                itemCount: message.file?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: InteractiveViewer(
                                panEnabled: false,
                                boundaryMargin: const EdgeInsets.all(50),
                                minScale: 0.5,
                                maxScale: 2,
                                child: Image.network(
                                  message.file![index].url ?? "",
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Image.network(
                        message.file![index].url ?? "",
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 0.75,
                vertical: kDefaultPadding / 2),
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(isSender ? 1 : 0.08),
                borderRadius: BorderRadius.circular(30)),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Card(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: InteractiveViewer(
                              panEnabled: false,
                              boundaryMargin: const EdgeInsets.all(50),
                              minScale: 0.5,
                              maxScale: 2,
                              child: Image.network(
                                message.file![0].url ?? "",
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Image.network(
                      message.file![0].url ?? "",
                    ),
                  ),
                )));
  }
}

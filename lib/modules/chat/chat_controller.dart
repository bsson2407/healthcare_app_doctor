import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/chats/conversation_response.dart';
import 'package:healthcare_app_doctor/repository/chat.repository.dart';

class ChatController extends GetxController {
  var chatRepository = Get.find<ChatRepository>();
  RxList<DataConversationResponse> listConversation =
      RxList<DataConversationResponse>([]);

  @override
  void onInit() {
    super.onInit();

    initListNotification();
  }

  void initListNotification() async {
    final response = await chatRepository.getAllConversation(1, 20);

    if (response.statusCode == 200) {
      // listBmi = response.data;
      listConversation.clear();
      listConversation.addAll(response.data);

      
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}

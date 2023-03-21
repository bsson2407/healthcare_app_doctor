import 'package:dio/dio.dart';
import 'package:healthcare_app_doctor/api/rest_api.dart';
import 'package:healthcare_app_doctor/models/chats/chat_response.dart';
import 'package:healthcare_app_doctor/models/chats/conversation_response.dart';
import 'package:healthcare_app_doctor/models/chats/message_request.dart';
import 'package:healthcare_app_doctor/models/chats/message_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';


class ChatRepository {
  final dio = Dio(); // Provide a dio instance

  Future<ConversationResponse> getAllConversation(
    int? page,
    int? pageSize,
  ) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': pageSize ?? 20,
    };

    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000);
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/conversation',
      queryParameters: queryParams,
    );

    return ConversationResponse.fromJson(response.data);
  }

  Future<ChatResponse> getMessage(
    String id,
    int? page,
    int? pageSize,
  ) async {
    final client = RestClient(dio);

    return await client.getChat(id, pageSize ?? 1, page ?? 10);
  }

  Future<MessageResponse> postMessage(String id, MessageRequest dto) async {
    final client = RestClient(dio);

    return await client.postChat(id, dto);
  }
}

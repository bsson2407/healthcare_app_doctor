import 'package:json_annotation/json_annotation.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse {
  String? message;
  int? statusCode;
  List<DataMessageResponse> data;

  ChatResponse({
    required this.data,
    this.statusCode,
    this.message,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}

@JsonSerializable()
class DataMessageResponse {
  String? id;
  String? conversationId;
  String? typeMessage;
  String? content;
  String? createdBy;
  DateTime? createdAt;
  DataUserMessageResponse? user;

  DataMessageResponse({
    this.id,
    this.conversationId,
    this.typeMessage,
    this.content,
    this.createdAt,
    this.createdBy,
    this.user,
  });

  factory DataMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DataMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataMessageResponseToJson(this);
}

@JsonSerializable()
class DataUserMessageResponse {
  String? id;
  String? fullName;
  String? avatar;

  DataUserMessageResponse({
    this.id,
    this.fullName,
    this.avatar,
  });

  factory DataUserMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DataUserMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataUserMessageResponseToJson(this);
}

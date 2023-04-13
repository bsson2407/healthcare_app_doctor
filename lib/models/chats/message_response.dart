import 'package:json_annotation/json_annotation.dart';

part 'message_response.g.dart';

@JsonSerializable()
class MessageResponse {
  String? message;
  int? statusCode;
  DataSendMessageResponse? data;

  MessageResponse({
    this.data,
    this.statusCode,
    this.message,
  });

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}

@JsonSerializable()
class DataSendMessageResponse {
  String? id;
  String? conversationId;
  String? typeMessage;
  String? content;
  DateTime? createdAt;
  String? createdBy;
  List<DataFileSendMessageResponse>? file;
  DataUserSendMessageResponse? user;

  DataSendMessageResponse(
      {this.id,
      this.conversationId,
      this.typeMessage,
      this.content,
      this.createdAt,
      this.createdBy,
      this.file,
      this.user});

  factory DataSendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DataSendMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataSendMessageResponseToJson(this);
}

@JsonSerializable()
class DataUserSendMessageResponse {
  String? id;
  String? avatar;
  String? fullName;

  DataUserSendMessageResponse({this.id, this.avatar, this.fullName});

  factory DataUserSendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DataUserSendMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataUserSendMessageResponseToJson(this);
}

@JsonSerializable()
class DataFileSendMessageResponse {
  String? id;
  String? url;
  String? name;
  String? messageId;

  DataFileSendMessageResponse({this.id, this.name, this.messageId, this.url});

  factory DataFileSendMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DataFileSendMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataFileSendMessageResponseToJson(this);
}

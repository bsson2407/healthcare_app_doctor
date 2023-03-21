import 'package:json_annotation/json_annotation.dart';

part 'conversation_response.g.dart';

@JsonSerializable()
class ConversationResponse {
  String? message;
  int? statusCode;
  List<DataConversationResponse> data;

  ConversationResponse({
    required this.data,
    this.statusCode,
    this.message,
  });

  factory ConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ConversationResponseToJson(this);
}

@JsonSerializable()
class DataConversationResponse {
  String? id;
  String? avatar;
  String? typeConversation;
  String? leaderId;
  DataLastMessageResponse? lastMessage;
  DateTime? updatedAt;
  List<DataUserMemberResponse> member;

  DataConversationResponse({
    this.id,
    this.avatar,
    this.typeConversation,
    this.leaderId,
    this.lastMessage,
    this.updatedAt,
    required this.member,
  });

  factory DataConversationResponse.fromJson(Map<String, dynamic> json) =>
      _$DataConversationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataConversationResponseToJson(this);
}

@JsonSerializable()
class DataUserMemberResponse {
  DataMemberResponse? user;

  DataUserMemberResponse({
    this.user,
  });

  factory DataUserMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$DataUserMemberResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataUserMemberResponseToJson(this);
}

@JsonSerializable()
class DataMemberResponse {
  String? id;
  String? fullName;
  String? avatar;

  DataMemberResponse({
    this.id,
    this.fullName,
    this.avatar,
  });

  factory DataMemberResponse.fromJson(Map<String, dynamic> json) =>
      _$DataMemberResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataMemberResponseToJson(this);
}

@JsonSerializable()
class DataLastMessageResponse {
  String? id;
  String? content;
  DateTime? createdAt;

  DataLastMessageResponse({
    this.id,
    this.content,
    this.createdAt,
  });

  factory DataLastMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$DataLastMessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataLastMessageResponseToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) => ChatResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => DataMessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataMessageResponse _$DataMessageResponseFromJson(Map<String, dynamic> json) =>
    DataMessageResponse(
      id: json['id'] as String?,
      conversationId: json['conversationId'] as String?,
      typeMessage: json['typeMessage'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
      user: json['user'] == null
          ? null
          : DataUserMessageResponse.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataMessageResponseToJson(
        DataMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'typeMessage': instance.typeMessage,
      'content': instance.content,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'user': instance.user,
    };

DataUserMessageResponse _$DataUserMessageResponseFromJson(
        Map<String, dynamic> json) =>
    DataUserMessageResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$DataUserMessageResponseToJson(
        DataUserMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
    };

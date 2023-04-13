// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      data: json['data'] == null
          ? null
          : DataSendMessageResponse.fromJson(
              json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataSendMessageResponse _$DataSendMessageResponseFromJson(
        Map<String, dynamic> json) =>
    DataSendMessageResponse(
      id: json['id'] as String?,
      conversationId: json['conversationId'] as String?,
      typeMessage: json['typeMessage'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String?,
      file: (json['file'] as List<dynamic>?)
          ?.map((e) =>
              DataFileSendMessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : DataUserSendMessageResponse.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataSendMessageResponseToJson(
        DataSendMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'typeMessage': instance.typeMessage,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'createdBy': instance.createdBy,
      'file': instance.file,
      'user': instance.user,
    };

DataUserSendMessageResponse _$DataUserSendMessageResponseFromJson(
        Map<String, dynamic> json) =>
    DataUserSendMessageResponse(
      id: json['id'] as String?,
      avatar: json['avatar'] as String?,
      fullName: json['fullName'] as String?,
    );

Map<String, dynamic> _$DataUserSendMessageResponseToJson(
        DataUserSendMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'fullName': instance.fullName,
    };

DataFileSendMessageResponse _$DataFileSendMessageResponseFromJson(
        Map<String, dynamic> json) =>
    DataFileSendMessageResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      messageId: json['messageId'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$DataFileSendMessageResponseToJson(
        DataFileSendMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'messageId': instance.messageId,
    };

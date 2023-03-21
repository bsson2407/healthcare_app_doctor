// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationResponse _$ConversationResponseFromJson(
        Map<String, dynamic> json) =>
    ConversationResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              DataConversationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ConversationResponseToJson(
        ConversationResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataConversationResponse _$DataConversationResponseFromJson(
        Map<String, dynamic> json) =>
    DataConversationResponse(
      id: json['id'] as String?,
      avatar: json['avatar'] as String?,
      typeConversation: json['typeConversation'] as String?,
      leaderId: json['leaderId'] as String?,
      lastMessage: json['lastMessage'] == null
          ? null
          : DataLastMessageResponse.fromJson(
              json['lastMessage'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      member: (json['member'] as List<dynamic>)
          .map(
              (e) => DataUserMemberResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataConversationResponseToJson(
        DataConversationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'typeConversation': instance.typeConversation,
      'leaderId': instance.leaderId,
      'lastMessage': instance.lastMessage,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'member': instance.member,
    };

DataUserMemberResponse _$DataUserMemberResponseFromJson(
        Map<String, dynamic> json) =>
    DataUserMemberResponse(
      user: json['user'] == null
          ? null
          : DataMemberResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataUserMemberResponseToJson(
        DataUserMemberResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

DataMemberResponse _$DataMemberResponseFromJson(Map<String, dynamic> json) =>
    DataMemberResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$DataMemberResponseToJson(DataMemberResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
    };

DataLastMessageResponse _$DataLastMessageResponseFromJson(
        Map<String, dynamic> json) =>
    DataLastMessageResponse(
      id: json['id'] as String?,
      content: json['content'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$DataLastMessageResponseToJson(
        DataLastMessageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

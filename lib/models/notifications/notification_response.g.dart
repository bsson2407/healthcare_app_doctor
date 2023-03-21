// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              DataNotificationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$NotificationResponseToJson(
        NotificationResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataNotificationResponse _$DataNotificationResponseFromJson(
        Map<String, dynamic> json) =>
    DataNotificationResponse(
      id: json['id'] as String?,
      title: json['title'] as String?,
      typeNotification: json['typeNotification'] as String?,
      content: json['content'] as String?,
      url: json['url'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      userId: json['userId'] as String?,
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$DataNotificationResponseToJson(
        DataNotificationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'typeNotification': instance.typeNotification,
      'content': instance.content,
      'url': instance.url,
      'createdAt': instance.createdAt?.toIso8601String(),
      'userId': instance.userId,
      'isRead': instance.isRead,
    };

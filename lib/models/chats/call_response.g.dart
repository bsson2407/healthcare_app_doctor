// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallVideoResponse _$CallVideoResponseFromJson(Map<String, dynamic> json) =>
    CallVideoResponse(
      conversationId: json['conversationId'] as String?,
      callerId: json['callerId'] as String?,
      calleeId: json['calleeId'] as String?,
    );

Map<String, dynamic> _$CallVideoResponseToJson(CallVideoResponse instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'callerId': instance.callerId,
      'calleeId': instance.calleeId,
    };

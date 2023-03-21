import 'package:json_annotation/json_annotation.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  String? message;
  int? statusCode;
  List<DataNotificationResponse> data;

  NotificationResponse({
    required this.data,
    this.statusCode,
    this.message,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}

@JsonSerializable()
class DataNotificationResponse {
  String? id;
  String? title;
  String? typeNotification;
  String? content;
  String? url;
  DateTime? createdAt;
  String? userId;
  bool? isRead;

  DataNotificationResponse(
      {this.id,
      this.title,
      this.typeNotification,
      this.content,
      this.url,
      this.createdAt,
      this.userId,
      this.isRead});

  factory DataNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$DataNotificationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataNotificationResponseToJson(this);
}

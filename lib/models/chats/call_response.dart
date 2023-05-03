import 'package:json_annotation/json_annotation.dart';

part 'call_response.g.dart';

@JsonSerializable()
class CallVideoResponse {
  String? conversationId;
  String? callerId;
  String? calleeId;

  CallVideoResponse({
    this.conversationId,
    this.callerId,
    this.calleeId,
  });

  factory CallVideoResponse.fromJson(Map<String, dynamic> json) =>
      _$CallVideoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CallVideoResponseToJson(this);
}

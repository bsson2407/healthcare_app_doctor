import 'package:json_annotation/json_annotation.dart';
part 'message_request.g.dart';

@JsonSerializable()
class MessageRequest {
  String? typeMessage;
  String? content;
  List<String>? file;

  MessageRequest({
    required this.typeMessage,
    this.content,
    required this.file,
  });

  factory MessageRequest.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MessageRequestToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'health_record_request.g.dart';

@JsonSerializable()
class HealthRecordRequest {
  String? height;
  String? weight;
  String? heartRateIndicator;
  String? systolic;
  String? diastolic;
  String? glucose;
  String? cholesterol;

  HealthRecordRequest({
     this.height,
     this.weight,
     this.heartRateIndicator,
     this.systolic,
     this.diastolic,
     this.glucose,
     this.cholesterol,
  });

  factory HealthRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$HealthRecordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$HealthRecordRequestToJson(this);
}

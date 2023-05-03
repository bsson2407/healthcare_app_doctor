import 'package:json_annotation/json_annotation.dart';
part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String? phone;
  String? password;
  String? fullName;
  String? address;
  DateTime? dateOfBirth;
  String? gender;
  String? job;
  String? medicalHistory;
  String? insuranceNumber;
  String? state;
  List<RegisterCarerRequest> carers;

  RegisterRequest({
    this.fullName,
    this.address,
    this.dateOfBirth,
    this.gender,
    this.job,
    this.state,
    required this.carers,
    this.medicalHistory,
    this.insuranceNumber,
    this.phone,
    this.password,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class RegisterCarerRequest {
  String? phone;
  String? fullName;

  RegisterCarerRequest({
    this.fullName,
    this.phone,
  });

  factory RegisterCarerRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterCarerRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterCarerRequestToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  String message;
  int statusCode;
  DataUserResponse? data;

  UserResponse({
    this.data,
    required this.statusCode,
    required this.message,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class DataUserResponse {
  String? id;
  String? phone;
  String? memberId;
  DoctorLoginResponse? doctor;

  DataUserResponse(
      {required this.id,
      required this.phone,
      required this.memberId,
      required this.doctor});

  factory DataUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DataUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DataUserResponseToJson(this);
}

@JsonSerializable()
class DoctorLoginResponse {
  String? id;
  String? fullName;
  String? gender;
  DateTime? dateOfBirth;
  String? address;
  String? phone;
  String? avatar;
  String? experience;
  String? description;
  String? workPlace;
  String? specialize;

  DoctorLoginResponse(
      {this.id,
      this.fullName,
      this.gender,
      this.address,
      this.avatar,
      this.experience,
      this.phone,
      this.description,
      this.workPlace,
      this.specialize,
      this.dateOfBirth});

  factory DoctorLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorLoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorLoginResponseToJson(this);
}

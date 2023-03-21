// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      data: json['data'] == null
          ? null
          : DataUserResponse.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

DataUserResponse _$DataUserResponseFromJson(Map<String, dynamic> json) =>
    DataUserResponse(
      id: json['id'] as String?,
      phone: json['phone'] as String?,
      memberId: json['memberId'] as String?,
      doctor: json['doctor'] == null
          ? null
          : DoctorLoginResponse.fromJson(
              json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataUserResponseToJson(DataUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'memberId': instance.memberId,
      'doctor': instance.doctor,
    };

DoctorLoginResponse _$DoctorLoginResponseFromJson(Map<String, dynamic> json) =>
    DoctorLoginResponse(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      avatar: json['avatar'] as String?,
      experience: json['experience'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
      workPlace: json['workPlace'] as String?,
      specialize: json['specialize'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$DoctorLoginResponseToJson(
        DoctorLoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'address': instance.address,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'experience': instance.experience,
      'description': instance.description,
      'workPlace': instance.workPlace,
      'specialize': instance.specialize,
    };

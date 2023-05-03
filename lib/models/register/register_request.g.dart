// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      fullName: json['fullName'] as String?,
      address: json['address'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String?,
      job: json['job'] as String?,
      state: json['state'] as String?,
      carers: (json['carers'] as List<dynamic>)
          .map((e) => RegisterCarerRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      medicalHistory: json['medicalHistory'] as String?,
      insuranceNumber: json['insuranceNumber'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
      'fullName': instance.fullName,
      'address': instance.address,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'gender': instance.gender,
      'job': instance.job,
      'medicalHistory': instance.medicalHistory,
      'insuranceNumber': instance.insuranceNumber,
      'state': instance.state,
      'carers': instance.carers,
    };

RegisterCarerRequest _$RegisterCarerRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterCarerRequest(
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$RegisterCarerRequestToJson(
        RegisterCarerRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'fullName': instance.fullName,
    };

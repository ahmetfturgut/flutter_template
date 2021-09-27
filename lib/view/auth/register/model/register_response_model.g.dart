// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
    Map<String, dynamic> json) {
  return RegisterResponseModel(
    success: json['success'] as bool?,
    error: json['error'] as String?,
    message: json['message'] as String?,
    data: json['data'] as String?,
  );
}

Map<String, dynamic> _$RegisterResponseModelToJson(
        RegisterResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };

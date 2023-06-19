// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponseDTO _$BaseResponseDTOFromJson(Map<String, dynamic> json) =>
    BaseResponseDTO(
      status: json['status'] as bool?,
      error: json['error'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$BaseResponseDTOToJson(BaseResponseDTO instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error': instance.error,
      'data': instance.data,
    };

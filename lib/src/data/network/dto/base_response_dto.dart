import 'package:json_annotation/json_annotation.dart';

part 'base_response_dto.g.dart';

@JsonSerializable()
class BaseResponseDTO {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'error')
  final String? error;
  @JsonKey(name: 'data')
  final dynamic data;

  BaseResponseDTO({
    required this.status,
    required this.error,
    required this.data,
  });

  factory BaseResponseDTO.fromJson(Map<String, dynamic> json) => _$BaseResponseDTOFromJson(json);
}

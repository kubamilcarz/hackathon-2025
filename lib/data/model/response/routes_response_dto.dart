import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:acc_hack/data/model/response/route_dto.dart';

part 'routes_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RoutesResponseDTO {
  final List<RouteDTO> routes;

  RoutesResponseDTO({required this.routes});

  // Factory method to parse the JSON
  factory RoutesResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$RoutesResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RoutesResponseDTOToJson(this);
}

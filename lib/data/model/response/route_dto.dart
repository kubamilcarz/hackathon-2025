import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:acc_hack/data/model/response/polyline_dto.dart';

part 'route_dto.g.dart';

@JsonSerializable()
class RouteDTO {
  final int distanceMeters;
  final String duration;
  final PolylineDTO polyline;

  RouteDTO(
      {required this.distanceMeters,
      required this.duration,
      required this.polyline});

  factory RouteDTO.fromJson(Map<String, dynamic> json) =>
      _$RouteDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RouteDTOToJson(this);
}

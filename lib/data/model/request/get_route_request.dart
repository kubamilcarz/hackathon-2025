import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_route_request.g.dart';

@JsonSerializable()
class GetRouteRequest {
  final String startPlaceId;
  final String destPlaceId;

  GetRouteRequest({required this.startPlaceId, required this.destPlaceId});

  factory GetRouteRequest.fromJson(Map<String, dynamic> json) =>
      _$GetRouteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetRouteRequestToJson(this);
}

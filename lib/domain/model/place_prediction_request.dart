import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_prediction_request.freezed.dart';

@freezed
abstract class PlacePredictionRequest with _$PlacePredictionRequest {
  const factory PlacePredictionRequest({
    required String text,
    required double radius,
    required double latitude,
    required double longitude,
  }) = _PlacePredictionRequest;
}

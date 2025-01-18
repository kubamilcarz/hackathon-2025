import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:acc_hack/data/model/response/place/place_predictions_response_dto.dart';

part 'place_prediction.freezed.dart';

@freezed
abstract class PlacePrediction with _$PlacePrediction {
  const factory PlacePrediction({
    required String description,
    required String secondaryText,
    required String mainText,
    required String placeId,
  }) = _PlacePrediction;
}

extension PredictionsResponseDTOMapper on PredictionsResponseDTO {
  List<PlacePrediction> toDomain() {
    return predictions
        .map((e) => PlacePrediction(
              description: e.description,
              secondaryText: e.structured_formatting.secondary_text,
              mainText: e.structured_formatting.main_text,
              placeId: e.place_id,
            ))
        .toList();
  }
}

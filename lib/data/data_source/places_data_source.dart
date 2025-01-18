import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:acc_hack/data/client/places_client.dart';
import 'package:acc_hack/data/model/response/place/place_predictions_response_dto.dart';
import 'package:acc_hack/domain/model/place_prediction_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlacesDataSource {
  final PlacesClient client;

  PlacesDataSource({required this.client});

  Future<PredictionsResponseDTO?> getPlacePredictions(
      PlacePredictionRequest request) async {
    try {
      return client.getPredictions(
        input: request.text,
        key: dotenv.get('GOOGLE_MAPS_API_KEY'),
        location: '${request.latitude},${request.longitude}',
        radius: request.radius.toInt(),
      );
    } catch (e) {}
    return null;
  }
}

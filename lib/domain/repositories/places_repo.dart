import 'package:acc_hack/data/data_source/places_data_source.dart';
import 'package:acc_hack/domain/model/place_prediction.dart';
import 'package:acc_hack/domain/model/place_prediction_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlacesRepo {
  final PlacesDataSource dataSource;

  PlacesRepo({required this.dataSource});
  Future<List<PlacePrediction>> getPlacePredictions(
      PlacePredictionRequest request) async {
    final result = await dataSource.getPlacePredictions(request);
    return result?.toDomain() ?? [];
  }
}

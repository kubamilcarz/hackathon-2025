import 'package:dio/dio.dart';
import 'package:acc_hack/data/config/app_configuration.dart';
import 'package:acc_hack/data/model/response/place/place_predictions_response_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'places_client.g.dart';

@RestApi(baseUrl: Config.googleApisBaseUrl)
abstract class PlacesClient {
  factory PlacesClient(Dio dio) = _PlacesClient;

  @GET('/maps/api/place/autocomplete/json')
  Future<PredictionsResponseDTO> getPredictions({
    @Query('input') required String input,
    @Query('key') required String key,
    @Query('location') required String location,
    @Query('radius') required int radius,
  });
}

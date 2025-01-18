import 'package:acc_hack/data/data_source/routes_data_source.dart';
import 'package:acc_hack/data/model/response/routes_response_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RoutesRepo {
  final RoutesDataSource dataSource;

  RoutesRepo({required this.dataSource});
  Future<RoutesResponseDTO> getSampleRoute() => dataSource.getSampleRoute();
  Future<RoutesResponseDTO> getRoute({
    required String startId,
    required String endId,
  }) =>
      dataSource.getRoute(
        startPlaceId: startId,
        destPlaceId: endId,
      );
}

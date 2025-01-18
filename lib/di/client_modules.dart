import 'package:dio/dio.dart';
import 'package:acc_hack/data/client/places_client.dart';
import 'package:acc_hack/data/client/routes_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RetrofitInjectableModule {
  RoutesClient getRoutesClient(Dio client) => RoutesClient(
        client,
      );
  PlacesClient getPlacesClient(Dio client) => PlacesClient(
        client,
      );
}

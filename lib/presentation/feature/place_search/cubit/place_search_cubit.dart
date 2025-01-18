import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:acc_hack/data/config/app_configuration.dart';
import 'package:acc_hack/domain/model/place_prediction.dart';
import 'package:acc_hack/domain/model/place_prediction_request.dart';
import 'package:acc_hack/domain/repositories/places_repo.dart';
import 'package:injectable/injectable.dart';

part 'place_search_cubit.freezed.dart';
part 'place_search_state.dart';

@injectable
class PlaceSearchCubit extends Cubit<PlaceSearchState> {
  final PlacesRepo _placesRepo;
  PlaceSearchCubit(this._placesRepo) : super(const PlaceSearchState.initial());

  LatLng cameraLocation = Config.krakowCenter;

  static const _radiusInMeters = 1000.0;

  void clear() {
    emit(const PlaceSearchState.initial(
      clear: true,
    ));
  }

  void setCameraLocation(LatLng location) {
    cameraLocation = location;
  }

  Future<List<PlacePrediction>> getPlacePredictions(String text) async {
    emit(const PlaceSearchState.loading());
    final result = await _placesRepo.getPlacePredictions(
      PlacePredictionRequest(
        text: text,
        latitude: cameraLocation.latitude,
        longitude: cameraLocation.longitude,
        radius: _radiusInMeters,
      ),
    );
    emit(PlaceSearchState.loaded(result));
    return result;
  }
}

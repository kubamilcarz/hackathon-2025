part of 'google_map_cubit.dart';

@freezed
class GoogleMapState with _$GoogleMapState {
  const factory GoogleMapState.initial({
    @Default(false) bool clear,
    String? startId,
    String? endId,
  }) = _Initial;

  const factory GoogleMapState.loading() = _Loading;

  const factory GoogleMapState.loaded({required Polyline polylineItem}) =
      _Loaded;
}

extension GoogleMapStateX on GoogleMapState {
  String? get startId => mapOrNull(initial: (state) => state.startId);
  String? get endId => mapOrNull(initial: (state) => state.endId);
}

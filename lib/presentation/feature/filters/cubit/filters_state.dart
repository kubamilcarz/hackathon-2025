part of 'filters_cubit.dart';

@freezed
abstract class FiltersState with _$FiltersState {
  const factory FiltersState({
    required FilterType filterType,
  }) = _FiltersState;
}

enum FilterType {
  safe,
  clean,
  rating,
  quiet,
}

extension FilterTypeExt on BuildContext {
  Color mapFilterTypeToColor(FilterType filterType) {
    switch (filterType) {
      case FilterType.safe:
        return colorPalette.roadSafety;
      case FilterType.clean:
        return colorPalette.air;
      case FilterType.rating:
        return colorPalette.feedback;
      case FilterType.quiet:
        return colorPalette.noise;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:acc_hack/presentation/theme/theme_helpers.dart';

part 'filters_cubit.freezed.dart';
part 'filters_state.dart';

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit()
      : super(const FiltersState(
          filterType: FilterType.safe,
        ));

  void changeFilter(FilterType filterType) {
    emit(FiltersState(
      filterType: filterType,
    ));
  }
}

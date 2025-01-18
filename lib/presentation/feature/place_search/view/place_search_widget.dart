import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:acc_hack/domain/model/place_prediction.dart';
import 'package:acc_hack/presentation/theme/theme_helpers.dart';

import '../place_search.dart';

class PlaceSearchWidget extends StatelessWidget {
  PlaceSearchWidget(
      {super.key, required this.onSelected, required this.hintText});

  final void Function(PlacePrediction) onSelected;
  final String hintText;

  TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaceSearchCubit, PlaceSearchState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          initial: (state) {
            if (state.clear) {
              textController?.clear();
            }
          },
        );
      },
      child: SizedBox(
        height: 38,
        child: TypeAheadField<PlacePrediction>(
          suggestionsCallback:
              context.read<PlaceSearchCubit>().getPlacePredictions,
          builder: (context, controller, focusNode) {
            textController = controller;
            return TextFormField(
              maxLines: 1,
              controller: controller,
              focusNode: focusNode,
              textAlignVertical: TextAlignVertical.bottom,
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 24,
                  color: context.colorPalette.iconsPrimary.withOpacity(.35),
                ),
                hintText: hintText,
                alignLabelWithHint: true,
                hintStyle: TextStyle(
                  color: context.colorPalette.iconsPrimary.withOpacity(.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 1,
                    color: context.colorPalette.iconsPrimary.withOpacity(.5),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 1,
                    color: context.colorPalette.iconsPrimary.withOpacity(.5),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 1,
                    color: context.colorPalette.iconsPrimary.withOpacity(.5),
                  ),
                ),
              ),
            );
          },
          onSelected: (place) {
            textController?.value = TextEditingValue(text: place.mainText);
            onSelected(place);
          },
          emptyBuilder: (context) => SizedBox(),
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion.description),
            );
          },
        ),
      ),
    );
  }
}

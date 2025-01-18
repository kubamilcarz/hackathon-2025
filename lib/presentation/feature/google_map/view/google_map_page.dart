import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:acc_hack/data/config/app_configuration.dart';
import 'package:acc_hack/di/injection.dart';
import 'package:acc_hack/presentation/common/components/text.dart';
import 'package:acc_hack/presentation/feature/filters/cubit/filters_cubit.dart';
import 'package:acc_hack/presentation/feature/filters/view/filters_drawer.dart';
import 'package:acc_hack/presentation/feature/place_search/cubit/place_search_cubit.dart';
import 'package:acc_hack/presentation/feature/place_search/view/place_search_widget.dart';
import 'package:acc_hack/presentation/theme/theme_helpers.dart';

import '../google_map.dart';

const _cameraDebouncerDuration = const Duration(milliseconds: 300);

@RoutePage()
class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GoogleMapCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<PlaceSearchCubit>(),
        ),
      ],
      child: const GoogleMapView(),
    );
  }
}

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapCubit, GoogleMapState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Center(child: UiText.mediumHeading('Welloway')),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.person_outline,
                    size: 28,
                    color: context.colorPalette.iconsPrimary,
                  ),
                )
              ],
              leading: Builder(builder: (context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: 36,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              }),
            ),
            drawer: FiltersDrawer(
              onSafeFilterPressed: () {
                context.read<FiltersCubit>().changeFilter(FilterType.safe);
              },
              onCleanFilterPressed: () {
                context.read<FiltersCubit>().changeFilter(FilterType.clean);
              },
              onRatingFilterPressed: () {
                context.read<FiltersCubit>().changeFilter(FilterType.rating);
              },
              onQuietFilterPressed: () {
                context.read<FiltersCubit>().changeFilter(FilterType.quiet);
              },
            ),
            body: _MapWidget());
      },
    );
  }
}

class _MapWidget extends StatefulWidget {
  const _MapWidget();

  @override
  State<_MapWidget> createState() => __MapWidgetState();
}

class __MapWidgetState extends State<_MapWidget> {
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  Set<Polyline> _polylines = {}; // Set to hold the polyline
  Timer? _cameraMoveDebouncer;
  PlaceSearchCubit get _placeSearchCubit => context.read<PlaceSearchCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<FiltersCubit, FiltersState>(
      listener: (context, state) {
        setState(() {
          _polylines = _polylines
              .map((e) => e.copyWith(
                    colorParam: context.mapFilterTypeToColor(state.filterType),
                  ))
              .toSet();
        });
      },
      child: BlocListener<GoogleMapCubit, GoogleMapState>(
        listener: (context, state) {
          state.map(
              initial: (state) {
                if (state.clear) {
                  setState(() {
                    _polylines = {};
                  });
                }
              },
              loading: (_) {},
              loaded: (state) {
                setState(() {
                  _polylines = {
                    state.polylineItem.copyWith(
                      colorParam: context.mapFilterTypeToColor(
                          context.read<FiltersCubit>().state.filterType),
                    )
                  };
                });
                mapController.future.then((controller) {
                  controller.animateCamera(CameraUpdate.newLatLngZoom(
                      state.polylineItem.points.first, 15));
                });
              });
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _StartEndFinderColumn(),
            ),
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                zoomControlsEnabled: true,
                initialCameraPosition:
                    CameraPosition(target: Config.krakowCenter, zoom: 14),
                myLocationEnabled: true,
                polylines: _polylines,
                onMapCreated: mapController.complete,
                onCameraMove: (position) {
                  _cameraMoveDebouncer?.cancel();
                  _cameraMoveDebouncer = Timer(
                      _cameraDebouncerDuration,
                      () =>
                          _placeSearchCubit.setCameraLocation(position.target));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StartEndFinderColumn extends StatelessWidget {
  const _StartEndFinderColumn();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              context.read<GoogleMapCubit>().clear();
              context.read<PlaceSearchCubit>().clear();
            },
            icon: Icon(
              Icons.chevron_left_outlined,
              size: 48,
            )),
        Expanded(
          child: Column(
            children: [
              PlaceSearchWidget(
                hintText: 'Start',
                onSelected: (place) {
                  context.read<GoogleMapCubit>().setStartId(place.placeId);
                },
              ),
              SizedBox(height: 8),
              PlaceSearchWidget(
                hintText: 'End',
                onSelected: (place) {
                  context.read<GoogleMapCubit>().setEndId(place.placeId);
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

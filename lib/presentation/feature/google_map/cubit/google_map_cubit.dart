import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:acc_hack/data/model/response/polyline_dto.dart';
import 'package:acc_hack/di/injection.dart';
import 'package:acc_hack/domain/repositories/routes_repo.dart';
import 'package:injectable/injectable.dart';

part 'google_map_cubit.freezed.dart';
part 'google_map_state.dart';

@Injectable()
class GoogleMapCubit extends Cubit<GoogleMapState> {
  GoogleMapCubit(this.repo) : super(const GoogleMapState.initial());
  final RoutesRepo repo;

  void clear() {
    emit(const GoogleMapState.initial(clear: true));
  }

  Future<void> setStartId(String id) async {
    emit(GoogleMapState.initial(startId: id, endId: state.endId));
  }

  Future<void> setEndId(String id) async {
    emit(GoogleMapState.initial(startId: state.startId, endId: id));
    if (state.startId != null) {
      fetchPolyline(
        startId: state.startId!,
        endId: id,
      );
    }
  }

  Future<void> fetchPolyline({
    required String startId,
    required String endId,
  }) async {
    try {
      emit(GoogleMapState.loading());
      final result = await getIt<RoutesRepo>().getRoute(
        startId: startId,
        endId: endId,
      );
      final decodedPolyline = result.routes.first.polyline
          .decodePolyline(result.routes.first.polyline.encodedPolyline);

      // Convert decoded points directly into LatLng objects
      final googleLatLng = decodedPolyline
          .map((item) => LatLng(item.latitude, item.longitude))
          .toList();

      print("Refresh route data!");

      // Create a Polyline object
      final newPolyline = Polyline(
        polylineId: const PolylineId("demoPolylineID"),
        points: googleLatLng,
        color:
            const Color.fromRGBO(0, 0, 0, 1), // Set the color of the polyline
        width: 5, // Set the width of the polyline
      );

      emit(GoogleMapState.loaded(polylineItem: newPolyline));
    } catch (e) {
      // Handle errors here, e.g., show a Snackbar or a message
      print("Error fetching polyline: $e");
    }
  }

  // List<LatLng> decodePolyline(String encoded) {
  //   List<LatLng> poly = [];
  //   int index = 0, lat = 0, lng = 0;
  //   int length = encoded.length;

  //   while (index < length) {
  //     // Decode latitude
  //     int b = 0;
  //     int shift = 0;
  //     int result = 0;
  //     while (true) {
  //       b = encoded.codeUnitAt(index++) - 63;
  //       result |= (b & 0x1F) << shift;
  //       shift += 5;
  //       if (b < 0x20) break;
  //     }
  //     int dlat = (result >> 1) ^ -(result & 1);
  //     lat += dlat;

  //     // Decode longitude
  //     result = 0;
  //     shift = 0;
  //     while (true) {
  //       b = encoded.codeUnitAt(index++) - 63;
  //       result |= (b & 0x1F) << shift;
  //       shift += 5;
  //       if (b < 0x20) break;
  //     }
  //     int dlng = (result >> 1) ^ -(result & 1);
  //     lng += dlng;

  //     // Add decoded LatLng to the list
  //     poly.add(LatLng(lat / 1e5, lng / 1e5));
  //   }

  //   return poly;
  // }
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<GoogleMapCubit, GoogleMapState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         state.map(initial: initial, loading: loading, loaded: (state) {

//         }
//         return const Placeholder();
//       },
//     );
//   }
// }

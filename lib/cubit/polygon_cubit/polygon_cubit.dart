import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bloc/bloc.dart';

part 'polygon_state.dart';

class PolygonCubit extends Cubit<PolygonState> {
  PolygonCubit() : super(const PolygonInitial());

  void drawPolygon() {
    emit(
      PolygonLoading(
        polygon: state.polygon,
        points: state.points,
      ),
    );
    final Set<Polygon> polygon = HashSet<Polygon>();
    polygon.add(
      Polygon(
        polygonId: const PolygonId('1'),
        points: state.points,
        fillColor: Colors.red.withOpacity(.4),
        strokeColor: Colors.black,
        geodesic: true,
        strokeWidth: 4,
      ),
    );
    emit(
      PolygonFetchSuccess(
        polygon: polygon,
        points: state.points,
      ),
    );
  }
}

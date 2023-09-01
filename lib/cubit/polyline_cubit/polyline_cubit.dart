import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bloc/bloc.dart';

part 'polyline_state.dart';

class PolylineCubit extends Cubit<PolylineState> {
  PolylineCubit() : super(const PolylineInitial());

  void drawPolyline() {
    emit(
      PolylineLoading(
        polyline: state.polyline,
        latLen: state.latLen,
      ),
    );
    final Set<Polyline> polyline = {};
    for (int i = 0; i < state.latLen.length; i++) {
      polyline.add(
        Polyline(
          polylineId: const PolylineId('1'),
          points: state.latLen,
          color: Colors.red,
        ),
      );
    }
    emit(
      PolylineFetchSuccess(
        polyline: polyline,
        latLen: state.latLen,
      ),
    );
  }
}

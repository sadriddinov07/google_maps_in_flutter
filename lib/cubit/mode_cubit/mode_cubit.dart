import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';

part 'mode_state.dart';

class ModeCubit extends Cubit<ModeState> {
  ModeCubit() : super(const ModeInitial());

  void changeMode(GoogleMapController controller) {
    if (state.isNight) {
      emit(ModeLoading(isNight: state.isNight));
      rootBundle.loadString("assets/light_mode.json").then(
            (value) => controller.setMapStyle(value),
          );

      emit(
        const ModeFetchSuccess(isNight: false),
      );
    } else {
      emit(ModeLoading(isNight: state.isNight));
      rootBundle.loadString("assets/night_mode.json").then(
            (value) => controller.setMapStyle(value),
          );

      emit(
        const ModeFetchSuccess(isNight: true),
      );
    }
  }
}

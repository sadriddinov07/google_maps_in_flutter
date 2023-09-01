import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'user_location_state.dart';

class UserLocationCubit extends Cubit<UserLocationState> {
  UserLocationCubit() : super(const UserLocationInitial());

  void getUserCurrentLocation(GoogleMapController controller) async {
    Set<Marker> markers = {};
    emit(UserLocationLoading(markers: state.markers));

    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      debugPrint("ERROR: $error");
    });

    Geolocator.getCurrentPosition().then(
      (value) async {
        markers.add(
          Marker(
            position: LatLng(value.latitude, value.longitude),
            markerId: const MarkerId("1"),
          ),
        );
        emit(UserLocationFetchSuccess(markers: markers));

        CameraPosition cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude),
          zoom: 14,
        );

        controller.animateCamera(
          CameraUpdate.newCameraPosition(cameraPosition),
        );
      },
    );
  }
}

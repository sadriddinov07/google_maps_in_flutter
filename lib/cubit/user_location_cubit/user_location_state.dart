part of 'user_location_cubit.dart';

@immutable
abstract class UserLocationState {
  final Set<Marker> markers;

  const UserLocationState({required this.markers});
}

class UserLocationInitial extends UserLocationState {
  const UserLocationInitial() : super(markers: const {});
}

class UserLocationLoading extends UserLocationState {
  const UserLocationLoading({required super.markers});
}

class UserLocationFailure extends UserLocationState {
  final String message;

  const UserLocationFailure({
    required super.markers,
    required this.message,
  });
}

class UserLocationFetchSuccess extends UserLocationState {
  const UserLocationFetchSuccess({required super.markers});
}

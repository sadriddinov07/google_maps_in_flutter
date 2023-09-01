part of 'polygon_cubit.dart';

@immutable
abstract class PolygonState {
  final Set<Polygon> polygon;
  final List<LatLng> points;

  const PolygonState({
    required this.polygon,
    required this.points,
  });
}

class PolygonInitial extends PolygonState {
  const PolygonInitial()
      : super(
          polygon: const {},
          points: const [
            LatLng(40.355605, 68.464952),
            LatLng(40.355041, 68.471804),
            LatLng(40.355958, 68.474953),
            LatLng(40.360245, 68.478453),
            LatLng(40.360245, 68.478453),
            LatLng(40.362980, 68.483985),
            LatLng(40.362611, 68.496115),
            LatLng(40.365864, 68.500967),
            LatLng(40.372296, 68.501064),
            LatLng(40.376894, 68.493923),
            LatLng(40.377236, 68.481030),
            LatLng(40.374418, 68.475761),
            LatLng(40.363484, 68.469818),
            LatLng(40.357077, 68.463652),
            LatLng(40.354941, 68.464549),
            LatLng(40.355605, 68.464952),
          ],
        );
}

class PolygonLoading extends PolygonState {
  const PolygonLoading({
    required super.polygon,
    required super.points,
  });
}

class PolygonFailure extends PolygonState {
  final String message;

  const PolygonFailure({
    required super.polygon,
    required super.points,
    required this.message,
  });
}

class PolygonFetchSuccess extends PolygonState {
  const PolygonFetchSuccess({
    required super.polygon,
    required super.points,
  });
}

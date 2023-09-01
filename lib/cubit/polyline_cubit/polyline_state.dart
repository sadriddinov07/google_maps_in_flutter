part of 'polyline_cubit.dart';

@immutable
abstract class PolylineState {
  final Set<Polyline> polyline;
  final List<LatLng> latLen;

  const PolylineState({
    required this.polyline,
    required this.latLen,
  });
}

class PolylineInitial extends PolylineState {
  const PolylineInitial()
      : super(polyline: const {}, latLen: const [
          LatLng(41.238570, 69.167754),
          LatLng(41.234886, 69.163100),
          LatLng(41.233887, 69.159945),
          LatLng(41.232992, 69.156707),
          LatLng(41.011535, 68.839527),
          LatLng(40.960004, 68.766282),
          LatLng(40.946984, 68.741355),
          LatLng(40.930483, 68.725700),
          LatLng(40.912715, 68.704042),
          LatLng(40.905981, 68.700638),
          LatLng(40.895177, 68.689995),
          LatLng(40.894145, 68.687212),
          LatLng(40.893870, 68.677159),
          LatLng(40.892642, 68.673639),
          LatLng(40.846219, 68.630604),
          LatLng(40.817634, 68.614987),
          LatLng(40.787491, 68.577664),
          LatLng(40.697890, 68.490610),
          LatLng(40.677999, 68.468349),
          LatLng(40.642706, 68.438583),
          LatLng(40.614471, 68.421950),
          LatLng(40.517096, 68.328476),
          LatLng(40.321324, 68.096435),
          LatLng(40.318731, 68.093620),
          LatLng(40.252710, 68.015702),
          LatLng(40.198589, 67.975499),
          LatLng(40.161068, 67.959184),
          LatLng(40.127877, 67.952272),
          LatLng(40.106503, 67.940616),
          LatLng(40.103087, 67.939382),
          LatLng(40.091243, 67.939075),
          LatLng(40.084512, 67.934096),
          LatLng(40.082071, 67.929600),
          LatLng(40.071171, 67.894480),
          LatLng(40.065784, 67.856281),
          LatLng(40.066006, 67.846419),
          LatLng(40.057717, 67.821479),
          LatLng(40.055399, 67.815595),
          LatLng(40.055797, 67.806942),
          LatLng(40.053114, 67.793747),
          LatLng(40.053710, 67.783061),
          LatLng(40.051326, 67.775836),
          LatLng(40.051624, 67.770038),
          LatLng(40.048676, 67.750080),
          LatLng(40.046523, 67.743807),
          LatLng(40.046788, 67.739784),
          LatLng(40.053209, 67.730017),
          LatLng(40.054616, 67.721234),
          LatLng(40.054225, 67.707820),
          LatLng(40.055320, 67.699479),
          LatLng(40.055033, 67.690184),
          LatLng(40.054095, 67.687154),
          LatLng(40.047061, 67.674979),
          LatLng(40.045497, 67.670621),
          LatLng(40.039502, 67.648783),
          LatLng(40.037208, 67.637548),
          LatLng(40.036687, 67.630739),
          LatLng(40.029440, 67.620491),
          LatLng(40.027563, 67.619436),
          LatLng(40.026207, 67.616542),
          LatLng(40.023105, 67.615112),
          LatLng(40.021723, 67.613988),
          LatLng(40.011372, 67.600200),
          LatLng(39.995381, 67.586241),
          LatLng(39.990660, 67.582870),
          LatLng(39.989147, 67.581100),
          LatLng(39.986904, 67.576879),
          LatLng(39.979719, 67.567682),
          LatLng(39.977371, 67.562712),
          LatLng(39.973902, 67.560090),
          LatLng(39.954998, 67.539314),
          LatLng(39.949935, 67.536897),
          LatLng(39.948082, 67.535229),
          LatLng(39.941113, 67.527058),
          LatLng(39.936832, 67.525628),
          LatLng(39.922023, 67.516534),
          LatLng(39.918602, 67.514934),
          LatLng(39.851025, 67.462584),
          LatLng(39.837398, 67.445175),
          LatLng(39.836535, 67.442894),
          LatLng(39.836744, 67.439047),
          LatLng(39.838496, 67.432919),
          LatLng(39.838313, 67.430604),
          LatLng(39.771668, 67.276148),
          LatLng(39.769235, 67.263858),
          LatLng(39.762849, 67.255551),
          LatLng(39.758427, 67.248503),
          LatLng(39.709221, 67.086416),
          LatLng(39.708226, 67.084407),
          LatLng(39.697883, 67.072973),
          LatLng(39.695263, 67.069467),
          LatLng(39.692408, 67.067867),
          LatLng(39.691700, 67.066981),
          LatLng(39.690915, 67.063883),
          LatLng(39.689290, 67.054010),
          LatLng(39.688400, 67.052444),
          LatLng(39.687194, 67.052172),
          LatLng(39.684653, 67.051763),
          LatLng(39.677814, 67.046963),
          LatLng(39.676033, 67.045295),
        ]);
}

class PolylineLoading extends PolylineState {
  const PolylineLoading({
    required super.polyline,
    required super.latLen,
  });
}

class PolylineFailure extends PolylineState {
  final String message;

  const PolylineFailure({
    required super.polyline,
    required super.latLen,
    required this.message,
  });
}

class PolylineFetchSuccess extends PolylineState {
  const PolylineFetchSuccess({
    required super.polyline,
    required super.latLen,
  });
}

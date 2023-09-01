import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/cubit/mode_cubit/mode_cubit.dart';
import 'package:google_maps_in_flutter/cubit/polygon_cubit/polygon_cubit.dart';
import 'package:google_maps_in_flutter/cubit/polyline_cubit/polyline_cubit.dart';
import 'package:google_maps_in_flutter/cubit/user_location_cubit/user_location_cubit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController? _controller;

  final initialCameraPosition = const CameraPosition(
    target: LatLng(40.366619, 68.479095),
    zoom: 14,
  );

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _controller = controller;
    });
  }

  @override
  void initState() {
    super.initState();

    context.read<PolylineCubit>().drawPolyline();
    context.read<PolygonCubit>().drawPolygon();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModeCubit, ModeState>(
      bloc: context.read<ModeCubit>(),
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          appBar: AppBar(
            title: const Text('Google Map'),
            elevation: 2,
            leading: BlocBuilder<ModeCubit, ModeState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () =>
                      context.read<ModeCubit>().changeMode(_controller!),
                  icon: Icon(
                    state.isNight ? Icons.light_mode : Icons.dark_mode,
                  ),
                );
              },
              bloc: context.read<ModeCubit>(),
            ),
          ),
          body: GoogleMap(
            liteModeEnabled: false,
            onMapCreated: _onMapCreated,
            polylines: context.read<PolylineCubit>().state.polyline,
            polygons: context.read<PolygonCubit>().state.polygon,
            markers: context.read<UserLocationCubit>().state.markers,
            initialCameraPosition: initialCameraPosition,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context
                .read<UserLocationCubit>()
                .getUserCurrentLocation(_controller!),
            child: const Icon(Icons.location_on),
          ),
        );
      },
    );
  }
}

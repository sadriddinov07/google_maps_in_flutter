import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_in_flutter/cubit/mode_cubit/mode_cubit.dart';
import 'package:google_maps_in_flutter/cubit/polygon_cubit/polygon_cubit.dart';
import 'package:google_maps_in_flutter/cubit/polyline_cubit/polyline_cubit.dart';
import 'package:google_maps_in_flutter/cubit/user_location_cubit/user_location_cubit.dart';
import 'package:google_maps_in_flutter/pages/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ModeCubit()),
        BlocProvider(create: (context) => PolylineCubit()),
        BlocProvider(create: (context) => PolygonCubit()),
        BlocProvider(create: (context) => UserLocationCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}

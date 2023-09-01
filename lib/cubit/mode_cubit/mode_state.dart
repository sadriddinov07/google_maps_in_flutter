part of 'mode_cubit.dart';

@immutable
abstract class ModeState {
  final bool isNight;

  const ModeState({
    required this.isNight,
  });
}

class ModeInitial extends ModeState {
  const ModeInitial() : super(isNight: false);
}

class ModeLoading extends ModeState {
  const ModeLoading({required super.isNight});
}

class ModeFailure extends ModeState {
  final String message;

  const ModeFailure({
    required super.isNight,
    required this.message,
  });
}

class ModeFetchSuccess extends ModeState {
  const ModeFetchSuccess({required super.isNight});
}

part of 'place_cubit.dart';

@immutable
sealed class PlaceState {
  const PlaceState();
}

final class PlaceInitial extends PlaceState {}

final class PlaceLoading extends PlaceState {}

final class PlaceAdded extends PlaceState {
  const PlaceAdded();
}

final class PlaceError extends PlaceState {
  final String message;
  const PlaceError({required this.message});
}

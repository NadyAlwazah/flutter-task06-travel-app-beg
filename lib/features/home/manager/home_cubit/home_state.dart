part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class SetFavoriteLoading extends HomeState {}

final class SetFavoriteSuccess extends HomeState {
  final bool isFavorite;

  SetFavoriteSuccess({required this.isFavorite});
}

final class SetFavoriteError extends HomeState {
  final String message;
  SetFavoriteError(this.message);
}

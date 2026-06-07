import 'package:bloc/bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/auth_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/home_services.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final homeServices = HomeServicesImpl();
  final authServices = AuthServicesImpl();

  Future<List<PlaceModel>> getPlaces() async {
    try {
      final places = await homeServices.fetchPlaces();
      final currentUser = authServices.currentUser();
      final favoritePlaces = await homeServices.fetchFavoritePlaces(
        currentUser!.uid,
      );
      final List<PlaceModel> finalPlaces = places.map((place) {
        final isFavorite = favoritePlaces.any((item) => item.id == place.id);
        return place.copyWith(isFavorite: isFavorite);
      }).toList();
      return finalPlaces;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> setFavorite(PlaceModel place) async {
    emit(SetFavoriteLoading());
    try {
      final currentUser = authServices.currentUser();

      final favoritePlaces = await homeServices.fetchFavoritePlaces(
        currentUser!.uid,
      );
      final isFavorite = favoritePlaces.any((item) => item.id == place.id);
      if (isFavorite) {
        await homeServices.removeFavoritePlace(
          userId: currentUser.uid,
          placeId: place.id,
        );
      } else {
        await homeServices.addFavoritePlace(
          userId: currentUser.uid,
          place: place,
        );
      }

      emit(SetFavoriteSuccess(isFavorite: !isFavorite));
    } catch (e) {
      emit(SetFavoriteError(e.toString()));
    }
  }
}

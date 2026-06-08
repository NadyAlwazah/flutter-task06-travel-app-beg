import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/auth_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/favorite_services.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final authServices = AuthServicesImpl();
  final favoriteServices = FavoriteServicesImp();

  Future<void> setFavorite(PlaceModel place) async {
    emit(SetFavoriteLoading());
    try {
      final currentUser = authServices.currentUser();

      final favoritePlaces = await favoriteServices.fetchFavoritePlaces(
        currentUser!.uid,
      );
      final isFavorite = favoritePlaces.any((item) => item.id == place.id);
      if (isFavorite) {
        await favoriteServices.removeFavoritePlaceUser(place.id);
      } else {
        await favoriteServices.addFavoritePlace(
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

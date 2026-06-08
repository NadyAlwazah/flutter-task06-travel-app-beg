import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/auth_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/favorite_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/firestore_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/home_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/api_paths.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final homeServices = HomeServicesImpl();
  final authServices = AuthServicesImpl();
  final favoriteServices = FavoriteServicesImp();
  final firestoreServices = FirestoreServices.instance;

  Future<List<PlaceModel>> getPlaces() async {
    try {
      final places = await homeServices.fetchPlaces();
      final currentUser = authServices.currentUser();
      final favoritePlaces = await favoriteServices.fetchFavoritePlaces(
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

      final favoritePlaces = await favoriteServices.fetchFavoritePlaces(
        currentUser!.uid,
      );
      final isFavorite = favoritePlaces.any((item) => item.id == place.id);
      if (isFavorite) {
        await favoriteServices.removeFavoritePlace(
          userId: currentUser.uid,
          placeId: place.id,
        );
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

  // Stream<List<PlaceModel>> getPlacesStream() {
  //   try {
  //     final placesStream = firestoreServices.collectionStream<PlaceModel>(
  //       path: ApiPaths.places(),
  //       builder: (data, id) => PlaceModel.fromMap(id, data),
  //     );
  //     return placesStream;
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  Stream<List<PlaceModel>> getPlacesStream() {
    final controller = StreamController<List<PlaceModel>>();

    final currentUser = authServices.currentUser();

    List<PlaceModel> latestPlaces = [];
    List<PlaceModel> latestFavorites = [];

    // Stream للأماكن
    final placesSub = firestoreServices
        .collectionStream<PlaceModel>(
          path: ApiPaths.places(),
          builder: (data, id) => PlaceModel.fromMap(id, data),
        )
        .listen((places) {
          latestPlaces = places;

          final merged = latestPlaces.map((place) {
            final isFav = latestFavorites.any((fav) => fav.id == place.id);
            return place.copyWith(isFavorite: isFav);
          }).toList();

          controller.add(merged);
        });

    // Stream للمفضلات
    final favoritesSub = firestoreServices
        .collectionStream<PlaceModel>(
          path: ApiPaths.favoritePlaces(currentUser!.uid),
          builder: (data, id) => PlaceModel.fromMap(id, data),
        )
        .listen((favorites) {
          latestFavorites = favorites;

          final merged = latestPlaces.map((place) {
            final isFav = latestFavorites.any((fav) => fav.id == place.id);
            return place.copyWith(isFavorite: isFav);
          }).toList();

          controller.add(merged);
        });

    // تنظيف
    controller.onCancel = () {
      placesSub.cancel();
      favoritesSub.cancel();
    };

    return controller.stream;
  }
}

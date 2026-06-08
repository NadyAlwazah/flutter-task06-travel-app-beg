import 'dart:async';

import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/auth_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/favorite_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/firestore_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/api_paths.dart';

abstract class HomeServices {
  Stream<List<PlaceModel>> getPlacesStream();
}

class HomeServicesImpl implements HomeServices {
  final authServices = AuthServicesImpl();
  final favoriteServices = FavoriteServicesImp();
  final firestoreServices = FirestoreServices.instance;

  @override
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

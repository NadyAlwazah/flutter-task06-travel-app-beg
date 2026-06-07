import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/firestore_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/api_paths.dart';

abstract class HomeServices {
  Future<List<PlaceModel>> fetchPlaces();
  Future<List<PlaceModel>> fetchFavoritePlaces(String userId);
  Future<void> addFavoritePlace({
    required String userId,
    required PlaceModel place,
  });
  Future<void> removeFavoritePlace({
    required String userId,
    required String placeId,
  });
}

class HomeServicesImpl implements HomeServices {
  final firestoreServices = FirestoreServices.instance;
  @override
  Future<List<PlaceModel>> fetchPlaces() async {
    final result = await firestoreServices.getCollection<PlaceModel>(
      path: ApiPaths.places(),
      builder: (data, documentId) => PlaceModel.fromMap(documentId, data),
    );
    return result;
  }

  @override
  Future<void> addFavoritePlace({
    required String userId,
    required PlaceModel place,
  }) async {
    await firestoreServices.setData(
      path: ApiPaths.favoritePlace(userId, place.id),
      data: place.toMap(),
    );
  }

  @override
  Future<void> removeFavoritePlace({
    required String userId,
    required String placeId,
  }) async {
    await firestoreServices.deleteData(
      path: ApiPaths.favoritePlace(userId, placeId),
    );
  }

  @override
  Future<List<PlaceModel>> fetchFavoritePlaces(String userId) async {
    final result = await firestoreServices.getCollection<PlaceModel>(
      path: ApiPaths.favoritePlaces(userId),
      builder: (data, documentId) => PlaceModel.fromMap(documentId, data),
    );
    return result;
  }
}

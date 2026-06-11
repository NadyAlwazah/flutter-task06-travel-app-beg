import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/auth_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/firestore_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/api_paths.dart';

abstract class FavoriteServices {
  Future<void> addFavoritePlace({
    required String userId,
    required PlaceModel place,
  });

  Future<void> removeFavoritePlaceUser(String placeId);
  Stream<List<PlaceModel>> getFavoritesPlacesUserStream();
  Future<List<PlaceModel>> fetchFavoritePlaces(String userId);
}

class FavoriteServicesImp implements FavoriteServices {
  // Singleton
  FavoriteServicesImp._();
  static final instance = FavoriteServicesImp._();
  final firestoreServices = FirestoreServices.instance;

  final authServices = AuthServicesImpl.instance;

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
  Future<List<PlaceModel>> fetchFavoritePlaces(String userId) async {
    final result = await firestoreServices.getCollection<PlaceModel>(
      path: ApiPaths.favoritePlaces(userId),
      builder: (data, documentId) => PlaceModel.fromMap(documentId, data),
    );
    return result;
  }

  @override
  Stream<List<PlaceModel>> getFavoritesPlacesUserStream() {
    final currentUser = authServices.currentUser();
    final favoritePlaces = firestoreServices.collectionStream<PlaceModel>(
      path: ApiPaths.favoritePlaces(currentUser!.uid),
      builder: (data, id) => PlaceModel.fromMap(id, data),
    );
    return favoritePlaces;
  }

  @override
  Future<void> removeFavoritePlaceUser(String placeId) async {
    final currentUser = authServices.currentUser();
    await firestoreServices.deleteData(
      path: ApiPaths.favoritePlace(currentUser!.uid, placeId),
    );
  }
}

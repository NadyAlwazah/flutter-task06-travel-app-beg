import 'package:bloc/bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/auth_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/favorite_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/firestore_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/api_paths.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final favoriteServices = FavoriteServicesImp();
  final authServices = AuthServicesImpl();
  final firestoreServices = FirestoreServices.instance;

  // Future<List<PlaceModel>> getFavoritesPlaces() async {
  //   try {
  //     final currentUser = authServices.currentUser();
  //     final favoritePlaces = await favoriteServices.fetchFavoritePlaces(
  //       currentUser!.uid,
  //     );
  //     return favoritePlaces;
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  Stream<List<PlaceModel>> getFavoritesPlacesStream() {
    try {
      final currentUser = authServices.currentUser();
      final favoritePlaces = firestoreServices.collectionStream<PlaceModel>(
        path: ApiPaths.favoritePlaces(currentUser!.uid),
        builder: (data, id) => PlaceModel.fromMap(id, data),
      );
      return favoritePlaces;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> removeFavorite(String placeId) async {
    try {
      final currentUser = authServices.currentUser();
      await favoriteServices.removeFavoritePlace(
        userId: currentUser!.uid,
        placeId: placeId,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

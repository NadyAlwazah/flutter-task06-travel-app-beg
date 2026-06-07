import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/firestore_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/api_paths.dart';
import 'package:meta/meta.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  PlaceCubit() : super(PlaceInitial());

  final firestore = FirestoreServices.instance;

  Future<void> addPlace({
    required String title,
    required String imageUrl,
    required String location,
    required double rating,
    required double price,
  }) async {
    emit(PlaceLoading());

    try {
      // id
      final id = FirebaseFirestore.instance.collection('places').doc().id;

      final place = PlaceModel(
        id: id,
        title: title,
        imageUrl: imageUrl,
        location: location,
        rating: rating,
        price: price,
      );

      await firestore.setData(
        path: ApiPaths.places(place.id),
        data: place.toMap(),
      );

      emit(const PlaceAdded());
    } catch (e) {
      emit(PlaceError(message: e.toString()));
    }
  }
}

import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/firestore_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/api_paths.dart';

abstract class HomeServices {
  Future<List<PlaceModel>> fetchPlaces();
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
}

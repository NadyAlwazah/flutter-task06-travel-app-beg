import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/firestore_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/api_paths.dart';

class PackagesServices {
  final firestoreServices = FirestoreServices.instance;

  //! إضافة package جديد يحتوي فقط على placeId
  Future<void> addPackage(String placeId) async {
    await firestoreServices.setData(
      path: ApiPaths.packages(placeId),
      data: {"placeId": placeId},
    );
  }

  Future<List<PlaceModel>> getPopularPackages() async {
    // جلب جميع الـ packages
    final packages = await firestoreServices.getCollection(
      path: ApiPaths.packages(),
      builder: (data, documentId) => data,
    );

    List<PlaceModel> result = [];

    for (var package in packages) {
      final placeId = package["placeId"];

      // جلب الـ place المرتبط بالـ package
      final placeDoc = await firestoreServices.getDocument(
        path: ApiPaths.places(placeId),
        builder: (data, id) => PlaceModel.fromMap(id, data),
      );

      result.add(placeDoc);
    }

    return result;
  }
}

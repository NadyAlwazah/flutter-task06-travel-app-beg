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
}

import 'package:cloud_firestore/cloud_firestore.dart';

class PackagesServices {
  final _firestore = FirebaseFirestore.instance;

  //! إضافة package جديد يحتوي فقط على placeId
  Future<void> addPackage(String placeId) async {
    await _firestore.collection("packages").doc(placeId).set({
      "placeId": placeId,
    });
  }
}

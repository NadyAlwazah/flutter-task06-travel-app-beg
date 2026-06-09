import 'package:flutter_task06_travel_app_beg/core/models/user_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/auth_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/firestore_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/api_paths.dart';

abstract class ProfileServices {
  Stream<UserModel> fetchUserDataStream();
  Future<UserModel> fetchUserData();
}

class ProfileServicesImp extends ProfileServices {
  final firestoreServices = FirestoreServices.instance;
  final authServices = AuthServicesImpl();
  @override
  Stream<UserModel> fetchUserDataStream() {
    final currentUser = authServices.currentUser();
    final profileStream = firestoreServices.documentStream<UserModel>(
      path: ApiPaths.user(currentUser!.uid),
      builder: (data, id) => UserModel.fromMap(data, id),
    );
    return profileStream;
  }

  @override
  Future<UserModel> fetchUserData() {
    final currentUser = authServices.currentUser();
    final userData = firestoreServices.getDocumnet<UserModel>(
      path: ApiPaths.user(currentUser!.uid),
      builder: (data, id) => UserModel.fromMap(data, id),
    );
    return userData;
  }
}

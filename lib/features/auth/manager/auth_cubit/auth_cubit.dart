import 'package:bloc/bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/models/user_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/auth_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/firestore_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/api_paths.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthServices authServices = AuthServicesImpl();

  final firestoreServices = FirestoreServices.instance;

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    try {
      final result = await authServices.loginWithEmailAndPassword(
        email,
        password,
      );
      if (result) {
        emit(const AuthLoaded());
      } else {
        emit(const AuthError(message: "Login faild"));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> registerWithEmailAndPassword(
    String email,
    String password,
    String fullName,
  ) async {
    emit(AuthLoading());
    try {
      final result = await authServices.registerWithEmailAndPassword(
        email,
        password,
      );
      if (result) {
        _saveUserModel(fullName: fullName, email: email);

        emit(const AuthLoaded());
      } else {
        emit(const AuthError(message: "Register faild"));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _saveUserModel({
    required String fullName,
    required String email,
  }) async {
    final currentUser = authServices.currentUser();
    final userModel = UserModel(
      id: currentUser!.uid,
      fullName: fullName,
      email: email,
    );
    await firestoreServices.setData(
      path: ApiPaths.users(userModel.id),
      data: userModel.toMap(),
    );
  }

  void checkAuth() {
    final user = authServices.currentUser();
    if (user != null) {
      emit(const AuthLoaded());
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> signOut() async {
    emit(const AuthSigningOut());
    try {
      await authServices.signOut();
      emit(const AuthSignedOut());
    } catch (e) {
      emit(AuthSignOutError(e.toString()));
    }
  }
}

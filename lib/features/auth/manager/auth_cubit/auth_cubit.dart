import 'package:bloc/bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/services/auth_services.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthServices authServices = AuthServicesImpl();

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
  ) async {
    emit(AuthLoading());
    try {
      final result = await authServices.registerWithEmailAndPassword(
        email,
        password,
      );
      if (result) {
        emit(const AuthLoaded());
      } else {
        emit(const AuthError(message: "Register faild"));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
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

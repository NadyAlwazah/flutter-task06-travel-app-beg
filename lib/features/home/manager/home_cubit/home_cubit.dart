import 'package:bloc/bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/home_services.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final homeServices = HomeServicesImpl();
  Future<List<PlaceModel>> getPlaces() async {
    try {
      final places = await homeServices.fetchPlaces();

      return places;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

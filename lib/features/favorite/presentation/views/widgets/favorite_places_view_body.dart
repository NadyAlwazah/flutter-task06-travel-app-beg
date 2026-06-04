import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/favorite/presentation/views/widgets/favorite_places_grid.dart';

class FavoritePlacesViewBody extends StatelessWidget {
  const FavoritePlacesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(children: [FavoritePlacesGrid(), SizedBox(height: 16)]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/popular_places_grid.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(children: [Expanded(child: PopularPlacesGrid())]),
    );
  }
}

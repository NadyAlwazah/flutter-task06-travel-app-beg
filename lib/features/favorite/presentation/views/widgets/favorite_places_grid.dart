import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/favorite/presentation/views/widgets/favorite_place_card.dart';

class FavoritePlacesGrid extends StatelessWidget {
  const FavoritePlacesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 0.90,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 9,
      itemBuilder: (context, index) {
        return const FavoritePlaceCard(
          imagePath: "assets/images/Copilot_20260604_000453.png",
          title: "Aonang Villa Resort",
          location: "afdasdf",
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/popular_place_card.dart';

class PopularPlacesGrid extends StatelessWidget {
  const PopularPlacesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 15,
        childAspectRatio: 0.70,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 9,
      itemBuilder: (context, index) {
        return const PopularPlaceCard(
          imagePath: "assets/images/Copilot_20260604_000453.png",
          title: "Aonang Villa Resort",
          location: "afdasdf",
          rating: 4,
          price: 200,
        );
      },
    );
  }
}

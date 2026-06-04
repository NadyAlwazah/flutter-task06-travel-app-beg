import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/popular_packages/presentation/views/widgets/popular_package_card.dart';

class PopularPackagesList extends StatelessWidget {
  const PopularPackagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return const PopularPackageCard(
          imagePath: 'assets/images/Copilot_20260604_000453.png',
          title: 'Santorini Island',
          dateRange: '18 July - 28 July',
          rating: 4.8,
          price: 1820,
          joinedCount: 24,
        );
      },
    );
  }
}

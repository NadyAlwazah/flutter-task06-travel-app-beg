import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/packages_services.dart';
import 'package:flutter_task06_travel_app_beg/features/popular_packages/presentation/views/widgets/popular_package_card.dart';

class PopularPackagesList extends StatelessWidget {
  const PopularPackagesList({super.key});

  @override
  Widget build(BuildContext context) {
    final packagesServices = PackagesServices.instance;

    return FutureBuilder<List<PlaceModel>>(
      future: packagesServices.getPopularPackages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: const CupertinoActivityIndicator(
                radius: 15,
                color: Color(0xFFFFB300),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          log("Error: ${snapshot.error}");
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No packages found"));
        }

        final packages = snapshot.data!;

        return ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemCount: packages.length,
          itemBuilder: (context, index) {
            final place = packages[index];
            return PopularPackageCard(
              imageUrl: place.imageUrl,
              title: place.title,
              dateRange: place.dateRange,
              rating: place.rating,
              price: place.price,
              joinedCount: place.joinedCount,
            );
          },
        );
      },
    );
  }
}

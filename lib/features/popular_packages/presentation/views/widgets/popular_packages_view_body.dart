import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/popular_packages/presentation/views/widgets/popular_packages_list.dart';

class PopularPackagesViewBody extends StatelessWidget {
  const PopularPackagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(children: [PopularPackagesList(), SizedBox(height: 16)]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task06_travel_app_beg/features/popular_packages/presentation/views/widgets/popular_packages_view_body.dart';

class PopularPackagesView extends StatelessWidget {
  const PopularPackagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //AppBar
        CustomAppBar(title: "Popular Packages"),

        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Popular Trip Package",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),

        // Body
        Expanded(child: PopularPackagesViewBody()),
      ],
    );
  }
}

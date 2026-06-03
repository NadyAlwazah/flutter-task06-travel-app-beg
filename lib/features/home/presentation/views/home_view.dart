import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //AppBar
        CustomAppBar(title: "Popular Places"),

        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "All Popular Places",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),

        // Body
        Expanded(child: HomeViewBody()),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task06_travel_app_beg/features/favorite/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_task06_travel_app_beg/features/favorite/presentation/views/widgets/favorite_places_view_body.dart';

class FavoritePlacesView extends StatelessWidget {
  const FavoritePlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //AppBar
          CustomAppBar(title: "Favorite Places"),

          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Favorite Places",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),

          // Body
          Expanded(child: FavoritePlacesViewBody()),
        ],
      ),
    );
  }
}

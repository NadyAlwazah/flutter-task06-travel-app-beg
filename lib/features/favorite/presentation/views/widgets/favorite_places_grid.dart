import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/features/favorite/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter_task06_travel_app_beg/features/favorite/presentation/views/widgets/favorite_place_card.dart';

class FavoritePlacesGrid extends StatelessWidget {
  const FavoritePlacesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoriteCubit>();
    return StreamBuilder(
      stream: cubit.getFavoritesPlacesStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: const CupertinoActivityIndicator(
                radius: 15,
                color: Colors.red,
              ),
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              "No favorite places found",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        final favoritePlaces = snapshot.data!;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            childAspectRatio: 0.90,
          ),
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: favoritePlaces.length,
          itemBuilder: (context, index) {
            final place = favoritePlaces[index];
            return FavoritePlaceCard(
              placeModel: place,
              // imagePath: "assets/images/Copilot_20260604_000453.png",
              // title: "Aonang Villa Resort",
              // location: "afdasdf",
            );
          },
        );
      },
    );
  }
}

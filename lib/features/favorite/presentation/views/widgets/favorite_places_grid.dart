import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/services/favorite_services.dart';
import 'package:flutter_task06_travel_app_beg/features/favorite/presentation/views/widgets/favorite_place_card.dart';

class FavoritePlacesGrid extends StatelessWidget {
  const FavoritePlacesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteServices = FavoriteServicesImp();
    return StreamBuilder(
      stream: favoriteServices.getFavoritesPlacesUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
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
          itemCount: favoritePlaces.length,
          itemBuilder: (context, index) {
            final place = favoritePlaces[index];
            return FavoritePlaceCard(placeModel: place);
          },
        );
      },
    );
  }
}

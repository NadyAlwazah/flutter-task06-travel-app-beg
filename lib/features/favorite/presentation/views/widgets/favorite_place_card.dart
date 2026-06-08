import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/features/favorite/manager/favorite_cubit/favorite_cubit.dart';

class FavoritePlaceCard extends StatelessWidget {
  final PlaceModel placeModel;

  const FavoritePlaceCard({super.key, required this.placeModel});

  @override
  Widget build(BuildContext context) {
    final widthScrren = MediaQuery.of(context).size.width;
    final favoriteCubit = context.read<FavoriteCubit>();
    return Container(
      width: widthScrren * 0.42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + Favorite icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(
                    "assets/images/Copilot_20260604_000453.png",
                    //!  placeModel.imageUrl,
                    height: widthScrren * 0.30,
                    width: widthScrren * 0.42,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () async {
                      await favoriteCubit.removeFavorite(placeModel.id);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 14,
                      child: Icon(Icons.favorite, color: Colors.red, size: 15),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),
            Text(
              placeModel.title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 17),

                Text(
                  placeModel.location,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

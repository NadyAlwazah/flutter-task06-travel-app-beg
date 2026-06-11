import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/core/services/home_services.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/popular_place_card.dart';

class PopularPlacesGrid extends StatelessWidget {
  const PopularPlacesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final homeServices = HomeServicesImpl.instance;

    return StreamBuilder<List<PlaceModel>>(
      stream: homeServices.getPlacesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: const CupertinoActivityIndicator(
                radius: 15,
                color: Colors.purple,
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              "No places found",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        final places = snapshot.data!;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            childAspectRatio: 0.70,
          ),
          itemCount: places.length,
          itemBuilder: (context, index) {
            final place = places[index];
            return PopularPlaceCard(placeModel: place);
          },
        );
      },
    );
  }
}

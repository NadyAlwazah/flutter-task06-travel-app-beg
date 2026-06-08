import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/models/place_model.dart';
import 'package:flutter_task06_travel_app_beg/features/home/manager/home_cubit/home_cubit.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/popular_place_card.dart';

class PopularPlacesGrid extends StatelessWidget {
  const PopularPlacesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return FutureBuilder<List<PlaceModel>>(
      future: cubit.getPlaces(),
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
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: const Text("No places found"),
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
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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

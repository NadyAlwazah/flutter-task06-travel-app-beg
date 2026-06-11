import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/theme/app_colors.dart';
import 'package:flutter_task06_travel_app_beg/features/favorite/presentation/views/favorite_places_view.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/home_view.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/add_place_bottom_sheet.dart';
import 'package:flutter_task06_travel_app_beg/features/popular_packages/presentation/views/popular_packages_view.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/profile_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBarLayout extends StatefulWidget {
  const BottomBarLayout({super.key});

  @override
  State<BottomBarLayout> createState() => _BottomBarLayoutState();
}

class _BottomBarLayoutState extends State<BottomBarLayout> {
  int currentIndex = 0;

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const PopularPackagesView(),
      const FavoritePlacesView(),
      const ProfileView(),
    ];
  }

  void _showAddBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const AddPlaceBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _buildScreens()[currentIndex],
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              onPressed: _showAddBottomSheet,
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),

          //Popular
          SalomonBottomBarItem(
            icon: const Icon(Icons.trending_up),
            title: const Text("Popular"),
            selectedColor: const Color(0xFFFFB300),
          ),

          /// Favorite
          SalomonBottomBarItem(
            // ),
            icon: const Icon(Icons.favorite),
            title: const Text("Favorite"),
            selectedColor: Colors.red,
          ),

          //Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person_outline),
            title: const Text("Profile"),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

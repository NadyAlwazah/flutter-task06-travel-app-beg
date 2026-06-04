import 'package:flutter/material.dart';

class FavoritePlaceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final VoidCallback? onFavoriteTap;
  const FavoritePlaceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,

    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final widthScrren = MediaQuery.of(context).size.width;

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
                    imagePath,
                    height: widthScrren * 0.30,
                    width: widthScrren * 0.42,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavoriteTap,
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
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 17),

                Text(
                  location,
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

import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/theme/app_colors.dart';

class PopularPlaceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final double rating;
  final double price;
  final VoidCallback? onFavoriteTap;

  const PopularPlaceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.rating,
    required this.price,
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
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 15,
                      ),
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

            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const Icon(Icons.star, color: Colors.amber, size: 16),

                const SizedBox(width: 2),
                Text(
                  rating.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 4),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '\$${price.toInt()}/',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(text: "Person"),
                ],
              ),
            ),

            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}

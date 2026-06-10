import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task06_travel_app_beg/core/theme/app_colors.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';

class PopularPackageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String dateRange;
  final double rating;
  final double price;
  final int joinedCount;

  const PopularPackageCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.dateRange,
    required this.rating,
    required this.price,
    required this.joinedCount,
  });

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return Container(
      width: widthScreen * 0.9,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imagePath,
              height: widthScreen * 0.34,
              width: widthScreen * 0.25,

              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '\$${price.toInt()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      dateRange,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),

                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SvgPicture.asset(
                          AssetsData.accountAvatarSvg3,
                          width: widthScreen * 0.07,
                          height: widthScreen * 0.07,
                        ),
                        Positioned(
                          left: 15,
                          child: SvgPicture.asset(
                            AssetsData.accountAvatarSvg2,
                            width: widthScreen * 0.07,
                            height: widthScreen * 0.07,
                          ),
                        ),
                        Positioned(
                          left: 31,
                          child: SvgPicture.asset(
                            AssetsData.accountAvatarSvg1,
                            width: widthScreen * 0.07,
                            height: widthScreen * 0.07,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Text(
                      '$joinedCount Person Joined',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

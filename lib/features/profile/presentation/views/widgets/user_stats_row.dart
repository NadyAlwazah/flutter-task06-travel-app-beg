import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/stat_item.dart';

class UserStatsRow extends StatelessWidget {
  final int rewardPoints;
  final int travelTrips;
  final int bucketList;

  const UserStatsRow({
    super.key,
    required this.rewardPoints,
    required this.travelTrips,
    required this.bucketList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(blurRadius: 5, offset: Offset(0, 2), color: Colors.black12),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          const StatItem(title: 'Reward Points', value: 360),
          _buildDivider(),
          const StatItem(title: 'Travel Trips', value: 238),
          _buildDivider(),
          const StatItem(title: 'Bucket List', value: 473),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(height: 60, width: 1, color: Colors.grey.withOpacity(0.1));
  }
}

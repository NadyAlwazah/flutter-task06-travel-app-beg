import 'package:flutter/widgets.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/settings_list.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/user_stats_row.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Center(
              child: ProfileCard(
                name: "Nady Alwazah",
                subTitle: "nadyslmanalwazah288@gmail.com",
                imagePath: AssetsData.accountAvatarSvg1,
              ),
            ),

            const SizedBox(height: 32),
            const UserStatsRow(
              rewardPoints: 360,
              travelTrips: 238,
              bucketList: 473,
            ),

            const SizedBox(height: 32),
            const SettingsList(),

            const SizedBox(height: 16),
            CustomButton(text: "Sign Out", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

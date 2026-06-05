import 'package:flutter/widgets.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/profile_card.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ProfileCard(
                name: "Nady Alwazah",
                subTitle: "nadyslmanalwazah288@gmail.com",
                imagePath: AssetsData.accountAvatarSvg1,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

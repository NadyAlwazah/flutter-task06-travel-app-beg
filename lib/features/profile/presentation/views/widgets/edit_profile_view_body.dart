import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/profile_card.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Center(
              child: ProfileCard(
                name: "N",
                subTitle: "email",
                isEmail: false,
                // name: user.fullName,
                // subTitle: user.email,
                imagePath: AssetsData.accountAvatarSvg1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

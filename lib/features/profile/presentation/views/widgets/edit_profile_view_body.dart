import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/edit_profile_form_fields.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/profile_card.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Center(
              child: ProfileCard(
                name: "N",
                // name: user.fullName,
                subTitle: "Change Profile Picture",
                isEmail: false,
                imagePath: AssetsData.accountAvatarSvg1,
              ),
            ),

            SizedBox(height: 32),
            EditProfileFormFields(),
          ],
        ),
      ),
    );
  }
}

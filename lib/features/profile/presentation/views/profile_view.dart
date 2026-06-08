import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task06_travel_app_beg/core/app/routes.dart';
import 'package:flutter_task06_travel_app_beg/core/theme/app_colors.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //AppBar
        CustomAppBar(
          title: "Profile",
          action: SvgPicture.asset(
            AssetsData.editPencilLineSvg,
            color: AppColors.primary,
          ),
          onTapAction: () => GoRouter.of(context).push(AppRouter.kEditProfile),
        ),

        // Body
        const Expanded(child: ProfileViewBody()),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task06_travel_app_beg/core/theme/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String subTitle;
  final String imagePath;
  final bool isEmail;
  const ProfileCard({
    super.key,
    required this.name,
    required this.subTitle,
    required this.imagePath,
    this.isEmail = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(imagePath),
        Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          subTitle,
          style: isEmail
              ? const TextStyle(color: Colors.grey)
              : const TextStyle(fontSize: 16, color: AppColors.primary),
        ),
      ],
    );
  }
}

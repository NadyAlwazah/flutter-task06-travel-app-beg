import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';

class SocialIconsRow extends StatelessWidget {
  final VoidCallback? onFacebookTap;
  final VoidCallback? onInstagramTap;
  final VoidCallback? onTwitterTap;

  const SocialIconsRow({
    super.key,
    this.onFacebookTap,
    this.onInstagramTap,
    this.onTwitterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCircleIcon(AssetsData.facebookIcon, onTap: onFacebookTap),
        const SizedBox(width: 16),
        buildCircleIcon(AssetsData.instagramIcon, onTap: onInstagramTap),
        const SizedBox(width: 16),
        buildCircleIcon(AssetsData.twitterIcon, onTap: onTwitterTap),
      ],
    );
  }

  Widget buildCircleIcon(String path, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(path, width: 50, height: 50, fit: BoxFit.cover),
    );
  }
}

import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  Widget _buildTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        leading: Icon(icon, size: 22, color: Colors.grey),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTile(icon: Icons.person_outline, title: 'Profile'),
        _buildTile(icon: Icons.bookmark_outline, title: 'Bookmarked'),
        _buildTile(icon: Icons.travel_explore, title: 'Previous Trips'),
        _buildTile(icon: Icons.settings_outlined, title: 'Settings'),
        _buildTile(icon: Icons.info_outline, title: 'Version'),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class AddToPackagesSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AddToPackagesSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text("Add this place to packages"),
      subtitle: const Text(
        "Enable to also save this place in packages collection",
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
      value: value,
      onChanged: onChanged,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
    );
  }
}

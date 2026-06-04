import 'package:flutter/material.dart';

class AddPlaceImagePicker extends StatelessWidget {
  final VoidCallback onTap;

  const AddPlaceImagePicker({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: const Center(
          child: Text(
            "Tap to upload image",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

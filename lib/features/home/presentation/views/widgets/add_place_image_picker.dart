import 'dart:io';

import 'package:flutter/material.dart';

class AddPlaceImagePicker extends StatelessWidget {
  final VoidCallback onTap;
  final File? pickedImage;
  const AddPlaceImagePicker({
    super.key,
    required this.onTap,
    required this.pickedImage,
  });

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
          image: pickedImage != null
              ? DecorationImage(
                  image: FileImage(pickedImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),

        child: pickedImage == null
            ? const Center(
                child: Text(
                  "Tap to upload image",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : null,
      ),
    );
  }
}

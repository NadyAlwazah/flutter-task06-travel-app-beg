import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/validators.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/custom_text_field.dart';

class AddPlaceFormFields extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController locationController;
  final TextEditingController ratingController;
  final TextEditingController priceController;

  const AddPlaceFormFields({
    super.key,
    required this.titleController,
    required this.locationController,
    required this.ratingController,
    required this.priceController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: titleController,
          label: "Place Title",
          validator: Validators.validateField,
        ),
        const SizedBox(height: 12),

        CustomTextField(
          controller: locationController,
          label: "Place Address",
          validator: Validators.validateField,
        ),
        const SizedBox(height: 12),

        CustomTextField(
          controller: ratingController,
          label: "Rating (1 - 5)",
          keyboardType: TextInputType.number,
          validator: Validators.validateField,
        ),
        const SizedBox(height: 12),

        CustomTextField(
          controller: priceController,
          label: "Price per person",
          keyboardType: TextInputType.number,
          validator: Validators.validateField,
        ),
      ],
    );
  }
}

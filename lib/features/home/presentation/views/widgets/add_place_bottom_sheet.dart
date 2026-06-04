import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/custom_text_field.dart';

class AddPlaceBottomSheet extends StatefulWidget {
  const AddPlaceBottomSheet({super.key});

  @override
  State<AddPlaceBottomSheet> createState() => _AddPlaceBottomSheetState();
}

class _AddPlaceBottomSheetState extends State<AddPlaceBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ratingdController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    addressController.dispose();
    ratingdController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(16),
      height: height * 0.45,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "Add New Place",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // Image Picker Placeholder
              GestureDetector(
                onTap: () {},
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
              ),

              const SizedBox(height: 16),

              // Title Field
              CustomTextField(
                controller: titleController,
                label: "Place Title",
              ),
              //ِAddress Field
              const SizedBox(height: 12),
              CustomTextField(
                controller: addressController,
                label: "Place Address",
              ),
              //Rating Field
              const SizedBox(height: 12),
              CustomTextField(
                controller: ratingdController,
                label: "Rating (1 - 5)",
                keyboardType: TextInputType.number,
              ),
              //Price Field
              const SizedBox(height: 12),
              CustomTextField(
                controller: priceController,
                label: "Price per person",
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 20),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Add Place",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/services/image_picker_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/packages_services.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:flutter_task06_travel_app_beg/features/home/manager/place_cubit/place_cubit.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/add_place_form_fields.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/add_place_image_picker.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/add_to_packages_switch.dart';
import 'package:go_router/go_router.dart';

class AddPlaceBottomSheet extends StatefulWidget {
  const AddPlaceBottomSheet({super.key});

  @override
  State<AddPlaceBottomSheet> createState() => _AddPlaceBottomSheetState();
}

class _AddPlaceBottomSheetState extends State<AddPlaceBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateRangeController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    ratingController.dispose();
    priceController.dispose();
    dateRangeController.dispose();

    super.dispose();
  }

  File? selectedImage;
  final imageService = ImagePickerService.instance;
  bool isUploading = false;
  final packagesServices = PackagesServices();
  bool addToPackages = false;

  Future<void> _pickImage() async {
    final img = await imageService.pickImageFromGallery();
    if (img != null && mounted) {
      setState(() => selectedImage = img);
    }
  }

  Future<void> _submit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;

    if (selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(message: "Please select an image", isError: true),
      );
      context.pop();
      return;
    }

    setState(() => isUploading = true);

    final imageUrl = await imageService.uploadImage(
      imageFile: selectedImage!,
      bucket: "places",
    );

    if (!context.mounted) return;

    if (imageUrl == null) {
      setState(() => isUploading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(message: "Image upload failed", isError: true),
      );
      context.pop();

      return;
    }

    final cubit = context.read<PlaceCubit>();

    final placeId = await cubit.addPlace(
      title: titleController.text.trim(),
      imageUrl: imageUrl,
      location: locationController.text.trim(),
      rating: double.parse(ratingController.text),
      price: double.parse(priceController.text),
      dateRange: dateRangeController.text,
    );

    if (addToPackages && placeId != null) {
      if (!context.mounted) return;
      packagesServices.addPackage(placeId);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(CustomSnackBar(message: "Place added successfully"));
    }
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

              // Image Picker
              AddPlaceImagePicker(
                pickedImage: selectedImage,
                onTap: _pickImage,
              ),

              const SizedBox(height: 16),

              AddPlaceFormFields(
                titleController: titleController,
                locationController: locationController,
                ratingController: ratingController,
                priceController: priceController,
                dateRangeController: dateRangeController,
              ),

              const SizedBox(height: 12),
              AddToPackagesSwitch(
                value: addToPackages,
                onChanged: (val) {
                  setState(() {
                    addToPackages = val;
                  });
                },
              ),

              BlocConsumer<PlaceCubit, PlaceState>(
                listenWhen: (previous, current) =>
                    current is PlaceAdded || current is PlaceError,
                listener: (context, state) {
                  if (state is PlaceAdded) {
                    context.pop();
                  } else if (state is PlaceError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      CustomSnackBar(message: state.message, isError: true),
                    );
                  }
                },
                buildWhen: (previous, current) =>
                    current is PlaceLoading || current is PlaceError,
                builder: (context, state) {
                  final isLoading = state is PlaceLoading || isUploading;
                  return CustomButton(
                    isLoading: isLoading,
                    text: "Add Place",
                    onPressed: isLoading ? null : () => _submit(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

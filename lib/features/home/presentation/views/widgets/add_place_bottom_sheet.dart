import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task06_travel_app_beg/features/home/manager/place_cubit/place_cubit.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/add_place_form_fields.dart';
import 'package:flutter_task06_travel_app_beg/features/home/presentation/views/widgets/add_place_image_picker.dart';
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
  TextEditingController ratingdController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    ratingdController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlaceCubit>();
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
              AddPlaceImagePicker(onTap: () {}),

              const SizedBox(height: 16),

              AddPlaceFormFields(
                titleController: titleController,
                locationController: locationController,
                ratingController: ratingdController,
                priceController: priceController,
              ),

              const SizedBox(height: 12),

              BlocConsumer<PlaceCubit, PlaceState>(
                listenWhen: (previous, current) =>
                    current is PlaceAdded || current is PlaceError,
                listener: (context, state) {
                  if (state is PlaceAdded) {
                    context.pop();
                  } else if (state is PlaceError) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                buildWhen: (previous, current) =>
                    current is PlaceLoading || current is PlaceError,
                builder: (context, state) {
                  if (state is PlaceLoading) {
                    return const CustomButton(isLoading: true);
                  }
                  return CustomButton(
                    text: "Add Place",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await cubit.addPlace(
                          title: titleController.text,
                          imageUrl: "",
                          location: locationController.text,
                          rating: double.parse(ratingdController.text),
                          price: double.parse(priceController.text),
                        );
                      }
                    },
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

import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/custom_phone_field.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/custom_text_form_field_profile.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/form_label.dart';

class EditProfileFormFields extends StatelessWidget {
  const EditProfileFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabel(text: "First Name"),
        SizedBox(height: 8),
        CustomTextFormFieldProfile(textInputType: TextInputType.text),
        SizedBox(height: 16),

        FormLabel(text: "Last Name"),
        SizedBox(height: 8),
        CustomTextFormFieldProfile(textInputType: TextInputType.text),
        SizedBox(height: 16),

        FormLabel(text: "Location"),
        SizedBox(height: 8),
        CustomTextFormFieldProfile(textInputType: TextInputType.text),
        SizedBox(height: 16),

        FormLabel(text: "Mobile Number"),
        SizedBox(height: 8),
        CustomPhoneField(),
      ],
    );
  }
}

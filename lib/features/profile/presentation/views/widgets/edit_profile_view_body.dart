import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/edit_profile_form_fields.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/profile_card.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    locationController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Center(
                child: ProfileCard(
                  name: "N",
                  // name: user.fullName,
                  subTitle: "Change Profile Picture",
                  isEmail: false,
                  imagePath: AssetsData.accountAvatarSvg1,
                ),
              ),

              const SizedBox(height: 32),
              EditProfileFormFields(
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                locationController: locationController,
                phoneNumberController: phoneNumberController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

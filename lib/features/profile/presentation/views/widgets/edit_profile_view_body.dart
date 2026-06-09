import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/services/edit_profile_services.dart';
import 'package:flutter_task06_travel_app_beg/core/services/profile_services.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/edit_profile_form_fields.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:go_router/go_router.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  static VoidCallback? onSaveCallback;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final editServices = EditProfileServicesImp();

  @override
  void initState() {
    super.initState();

    EditProfileViewBody.onSaveCallback = saveProfile;
  }

  Future<void> saveProfile() async {
    if (_formKey.currentState!.validate()) {
      await editServices.updateUserData(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        location: locationController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
      );

      if (!mounted) return;
      context.pop();
    }
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    locationController.dispose();
    phoneNumberController.dispose();
    EditProfileViewBody.onSaveCallback = null;
  }

  @override
  Widget build(BuildContext context) {
    final profileServices = ProfileServicesImp();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: profileServices.fetchUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData) {
              return const Text("No user data found");
            }
            // UserModel
            final user = snapshot.data!;

            // تعبئة الحقول بالبيانات
            firstNameController.text = user.firstName ?? '';
            lastNameController.text = user.lastName ?? '';
            locationController.text = user.location ?? '';
            phoneNumberController.text = user.phoneNumber ?? '';

            return Form(
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
            );
          },
        ),
      ),
    );
  }
}

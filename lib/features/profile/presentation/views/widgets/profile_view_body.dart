import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/app/routes.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/assets.dart';
import 'package:flutter_task06_travel_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/profile_card.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/settings_list.dart';
import 'package:flutter_task06_travel_app_beg/features/profile/presentation/views/widgets/user_stats_row.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Center(
              child: ProfileCard(
                name: "Nady Alwazah",
                subTitle: "nadyslmanalwazah288@gmail.com",
                imagePath: AssetsData.accountAvatarSvg1,
              ),
            ),

            const SizedBox(height: 32),
            const UserStatsRow(
              rewardPoints: 360,
              travelTrips: 238,
              bucketList: 473,
            ),

            const SizedBox(height: 32),
            const SettingsList(),

            const SizedBox(height: 16),
            BlocConsumer<AuthCubit, AuthState>(
              listenWhen: (previous, current) =>
                  current is AuthSignedOut || current is AuthSignOutError,
              listener: (context, state) {
                if (state is AuthSignedOut) {
                  context.go(AppRouter.kSignin);
                } else if (state is AuthSignOutError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              buildWhen: (previous, current) => current is AuthSigningOut,
              builder: (context, state) {
                if (state is AuthSigningOut) {
                  return const CustomButton(isLoading: true);
                }

                return CustomButton(
                  text: "Sign Out",
                  onPressed: () async {
                    await cubit.signOut();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

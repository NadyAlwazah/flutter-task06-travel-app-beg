import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task06_travel_app_beg/core/app/routes.dart';
import 'package:flutter_task06_travel_app_beg/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter_task06_travel_app_beg/features/home/manager/place_cubit/place_cubit.dart';
import 'package:flutter_task06_travel_app_beg/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    publishableKey:
        'sb_publishable_BiclXkpzQkfrqtS7nt1-Kg_IKM4l6Zx', //! المفتاح العام للمشروع
    url: 'https://wufaopdrbmsmnpcnirhe.supabase.co',
    // url: "https://wufaopdrbsmmnpcnihre.supabase.co", //! رابط مشروعك
    // anonKey:
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind1ZmFvcGRyYm1zbW5wY25pcmhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODEwMzg0OTUsImV4cCI6MjA5NjYxNDQ5NX0.ch31a_HjOnhWmHKHp1sSynFVVIZNeVfx3vUiB72o79s', //! المفتاح العام للمشروع
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => PlaceCubit()),
      ],
      child: const TravelApp(),
    ),
  );
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sports_zone/data/cubits/leagues_cubit/leagues_cubit.dart';
import 'package:sports_zone/screens/leagues_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LeaguesCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Sports Zone',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(38, 36, 60, 100)),
              useMaterial3: true,
            ),
            home: const LeaguesScreen(countryId: 1), // Assuming countryId 1 for example
          );
        },
      ),
    );
  }
}

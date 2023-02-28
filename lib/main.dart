import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/configs/app_theme.dart';
import 'package:flutter_starter/home/controllers/home_screen_cubit.dart';
import 'package:flutter_starter/home/controllers/home_screen_state.dart';
import 'package:flutter_starter/home/screens/home_screen.dart';
import 'package:flutter_starter/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Starter',
      theme: primaryTheme,
      initialRoute: '/home',
      routes: {
        '/home': (context) {
          return BlocProvider<HomeScreenCubit>(
            create: (BuildContext context) => HomeScreenCubit(
              const HomeScreenState(),
            ),
            child: const HomeScreen(),
          );
        },
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

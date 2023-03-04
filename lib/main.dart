import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/configs/app_theme.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_bloc.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_state.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_bloc.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_state.dart';
import 'package:flutter_starter/home/screens/home_screen.dart';
import 'package:flutter_starter/injection.dart';
import 'package:flutter_starter/login/controllers/login_screen_cubit.dart';
import 'package:flutter_starter/login/controllers/login_screen_state.dart';
import 'package:flutter_starter/login/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await configureDependencies();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app_title'.tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: primaryTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) {
          return BlocProvider<LoginScreenCubit>(
            create: (BuildContext context) => LoginScreenCubit(
              const LoginScreenState(),
            ),
            child: const LoginScreen(),
          );
        },
        '/home': (context) {
          return MultiBlocProvider(providers: [
            BlocProvider<HomeScreenLoginBloc>(
              create: (BuildContext context) => HomeScreenLoginBloc(
                HomeScreenLoginState(isLoggedIn: true),
              ),
            ),
            BlocProvider<HomeScreenBoardBloc>(
              create: (BuildContext context) => HomeScreenBoardBloc(
                HomeScreenBoardState(),
              ),
            ),
          ], child: const HomeScreen());
        },
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

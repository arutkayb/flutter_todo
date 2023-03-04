import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_bloc.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_bloc.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_event.dart';
import 'package:flutter_starter/home/controllers/login_controller/home_screen_login_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenLoginBloc _loginController;
  late HomeScreenBoardBloc _boardController;

  @override
  void initState() {
    super.initState();
    _loginController = context.read<HomeScreenLoginBloc>();
    _boardController = context.read<HomeScreenBoardBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<HomeScreenLoginBloc, HomeScreenLoginState>(
          listener: (context, state) {
            if (!state.isLoggedIn) {
              Navigator.pushReplacementNamed(context, '/login');
            }
          },
          child: Container(),
        ),
      ),
      appBar: AppBar(
        title: const Text("Flutter Starter"),
        actions: [
          GestureDetector(
            onTap: _logout,
            child: Row(
              children: const [
                Text("Log-out"),
                Icon(Icons.logout_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _logout() {
    _loginController.add(LogOutPressed());
  }
}

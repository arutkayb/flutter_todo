import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/models/user.dart';
import 'package:flutter_starter/login/controllers/login_screen_cubit.dart';
import 'package:flutter_starter/login/controllers/login_screen_state.dart';
import 'package:flutter_starter/utils/connection_utils.dart';
import 'package:flutter_starter/utils/dialog_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginScreenCubit _controller;

  @override
  void initState() {
    super.initState();
    _controller = context.read<LoginScreenCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<LoginScreenCubit, LoginScreenState>(
          bloc: _controller,
          builder: (context, state) {
            return SignInScreen(
              providers: [
                EmailAuthProvider(),
              ],
              actions: [
                AuthStateChangeAction<SigningUp>((context, authState) async {
                  _signUpAction();
                }),
                AuthStateChangeAction<SignedIn>((context, authState) {
                  _checkLogin();
                }),
              ],
            );
          },
        ),
      ),
    );
  }

  void _checkLogin() async {
    if (!(await checkInternetConnection())) {
      showSafeConfirmationDialog(context,
          title: 'failed'.tr(),
          content: 'check_internet_connection'.tr(),
          confirmButtonText: 'try_again'.tr(), confirmAction: () {
        _checkLogin();
      });
      return;
    }

    if (_controller.isLoggedIn()) {
      User? user = await _controller.createUser();
      // TODO: handle if not created
      _controller.signedIn();
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void _signUpAction() {
    showSafeSnackBar(context, content: 'Successfully signed up');
    Navigator.pushReplacementNamed(context, '/login');
  }
}

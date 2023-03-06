import 'package:flutter_starter/common/configs/app_theme.dart';

abstract class IUseCaseSettings {
  Future<bool> saveAppTheme(AppTheme appTheme);

  AppTheme getAppTheme();
}

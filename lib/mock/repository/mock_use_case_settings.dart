import 'package:flutter_starter/common/configs/app_theme.dart';
import 'package:flutter_starter/common/repository/use_cases/settings/i_use_case_settings.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class MockUseCaseSettings extends UseCaseBase implements IUseCaseSettings {
  @override
  AppTheme getAppTheme() {
    // TODO: implement getAppTheme
    throw UnimplementedError();
  }

  @override
  Future<bool> saveAppTheme(AppTheme appTheme) {
    // TODO: implement saveAppTheme
    throw UnimplementedError();
  }

  @override
  Future<String> exportDataAsJsonString() {
    // TODO: implement exportData
    throw UnimplementedError();
  }
}

import 'dart:convert';

import 'package:flutter_starter/common/configs/app_theme.dart';
import 'package:flutter_starter/common/repository/use_cases/settings/i_use_case_settings.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class UseCaseSettings extends UseCaseBase implements IUseCaseSettings {
  @override
  AppTheme getAppTheme() {
    return localDataManager.getAppTheme();
  }

  @override
  Future<bool> saveAppTheme(AppTheme appTheme) {
    return localDataManager.saveAppTheme(appTheme);
  }

  @override
  Future<String> exportDataAsJsonString() async {
    final data = await remoteDataManager.exportData();
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(data);
    return prettyprint;
  }
}

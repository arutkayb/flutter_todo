import 'package:flutter_starter/common/configs/app_theme.dart';
import 'package:flutter_starter/common/repository/use_cases/analytics/i_use_case_analytics.dart';
import 'package:flutter_starter/common/repository/use_cases/settings/i_use_case_settings.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';

class MockUseCaseAnalytics extends UseCaseBase implements IUseCaseAnalytics {
  @override
  Future<void> logLogin() {
    // TODO: implement logLogin
    throw UnimplementedError();
  }

}

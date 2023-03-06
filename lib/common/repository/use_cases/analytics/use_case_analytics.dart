import 'package:flutter_starter/common/repository/use_cases/analytics/i_use_case_analytics.dart';
import 'package:flutter_starter/common/repository/use_cases/use_case_base.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class UseCaseAnalytics extends UseCaseBase implements IUseCaseAnalytics {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Future<void> logLogin() async {
    analytics.logLogin();
  }

  //TODO: create logging functions for other types of events
}

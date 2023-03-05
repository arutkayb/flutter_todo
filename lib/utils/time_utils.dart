import 'package:duration/duration.dart';
import 'package:easy_localization/easy_localization.dart';

String formatDate(DateTime dateTime) {
  var formatter = DateFormat('dd-MM-yyyy');
  String formattedTime = DateFormat('kk:mm:ss a').format(dateTime);
  String formattedDate = formatter.format(dateTime);

  return "$formattedDate $formattedTime";
}

String formatDuration(Duration duration) {
  return "~${printDuration(
    duration,
    abbreviated: true,
  )}";
}

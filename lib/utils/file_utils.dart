import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:path_provider/path_provider.dart';

Future<String> saveStringAsFile(String content) async {
  Directory? downloadsDir = await getDownloadsDirectory();
  if (downloadsDir == null) {
    throw Exception('export_dir_not_available'.tr());
  }
  String downloadsDirPath = downloadsDir.path;

  final fullPath = "$downloadsDirPath/${generateUid()}.txt";

  try {
    final file = File(fullPath);
    await file.writeAsString(content);
  } catch (e) {
    throw Exception('export_dir_not_available'.tr());
  }

  return fullPath;
}

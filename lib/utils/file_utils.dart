import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_starter/utils/string_utils.dart';
import 'package:document_file_save_plus/document_file_save_plus.dart';

Future<String> saveStringAsFile(String content) async {
  final fileName = "${generateUid()}.txt";
  try {
    List<int> textBytes = utf8.encode(content);
    Uint8List textBytes1 = Uint8List.fromList(textBytes);

    final documentFileSave = DocumentFileSavePlus();
    await documentFileSave.saveFile(textBytes1, fileName, "text/plain");
  } catch (e) {
    throw Exception('export_dir_not_available'.tr());
  }

  final extraNotes = Platform.isAndroid ? 'downloads_folder'.tr() : "";
  return "$extraNotes $fileName";
}

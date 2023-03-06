import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/utils/time_utils.dart';

class StatisticsTaskCard extends StatelessWidget {
  final BoardTask boardTask;

  const StatisticsTaskCard(this.boardTask, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = boardTask.title ?? "new_board_task".tr();
    final dateStart = formatDate(boardTask.dateStart!);
    final dateEnd = formatDate(boardTask.dateEnd!);
    final duration =
        formatDuration(boardTask.dateEnd!.difference(boardTask.dateStart!));
    final description =
        "${'start_time'.tr()}: $dateStart\n${'end_time'.tr()}: $dateEnd\n${'task_duration'.tr()}: $duration";

    return Card(
      child: ListTile(
        leading: const Icon(Icons.task_outlined),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}

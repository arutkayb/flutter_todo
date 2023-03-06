import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/board_task.dart';
import 'package:flutter_starter/statistics/controllers/statistics_screen_cubit.dart';
import 'package:flutter_starter/statistics/controllers/statistics_screen_state.dart';
import 'package:flutter_starter/statistics/widgets/statistics_task_card.dart';
import 'package:flutter_starter/utils/time_utils.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  late StatisticsScreenCubit _controller;

  final _pageViewController = PageController(
    initialPage: 0,
  );
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = context.read<StatisticsScreenCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final boardName =
        "${_controller.state.fullBoard.board.name} ${'statistics'.tr()}";

    return Scaffold(
      appBar: AppBar(
        title: Text(boardName),
      ),
      body: SafeArea(
        child: BlocBuilder<StatisticsScreenCubit, StatisticsScreenState>(
          builder: (context, state) {
            final boardLists = state.fullBoard.boardLists;
            const pageCount = 2;
            return Column(
              children: [
                Expanded(child: _getBoardLists(boardLists)),
                PageViewDotIndicator(
                  currentItem: _selectedPage,
                  count: pageCount,
                  unselectedColor: Colors.black26,
                  selectedColor: Colors.blue,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _getBoardLists(List<BoardList>? boardLists) {
    List<Widget> pageWidgets = List.empty(growable: true);

    pageWidgets.add(_getBoardStatistics());
    pageWidgets.add(_getFinishedTasksWidget());

    return PageView(
      controller: _pageViewController,
      children: pageWidgets,
      onPageChanged: (page) {
        setState(() {
          _selectedPage = page;
        });
      },
    );
  }

  Widget _getBoardStatistics() {
    final finishedTaskCount = _controller.getNumberOfFinishedTasks();
    final averageTaskDuration = _controller.getAverageTaskFinishTime();
    final notStartedTaskCount = _controller.getNumberOfNotStartedTasks();
    final startedNotFinishedTaskCount =
        _controller.getNumberOfStartedNotFinishedTasks();

    final finishedTaskCountText =
        "${'finished_task_count_text'.tr()}: $finishedTaskCount";
    final averageTaskDurationText =
        "${'average_task_duration_text'.tr()}: ${averageTaskDuration == null ? 'unknown'.tr() : formatDuration(averageTaskDuration)}";
    final notStartedTaskCountText =
        "${'not_started_task_count_text'.tr()}: $notStartedTaskCount";
    final startedNotFinishedTaskCountText =
        "${'started_not_finished_task_count_text'.tr()}: $startedNotFinishedTaskCount";

    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _getStatisticsTextWidget(finishedTaskCountText),
        _getStatisticsTextWidget(averageTaskDurationText),
        _getStatisticsTextWidget(notStartedTaskCountText),
        _getStatisticsTextWidget(startedNotFinishedTaskCountText),
      ],
    ));
  }

  Widget _getStatisticsTextWidget(String text) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ));
  }

  Widget _getFinishedTasksWidget() {
    List<BoardTask> tasks = _getFinishedBoardTasks();

    final noTasksFoundWidget =
        Center(child: const Text("no_finished_tasks_found").tr());
    if (tasks.isEmpty) {
      return noTasksFoundWidget;
    }

    List<Widget>? taskList;

    try {
      taskList = tasks.map((task) => StatisticsTaskCard(task)).toList();
    } catch (e) {
      //ignore
    }

    final title = Center(child: const Text("finished_tasks", style: TextStyle(fontSize: 24.0),).tr(),);

    return (taskList == null || taskList.isEmpty)
        ? noTasksFoundWidget
        : ListView(
            children: [title,...taskList],
          );
  }

  List<BoardTask> _getFinishedBoardTasks() {
    List<BoardTask> tasks = List.empty(growable: true);
    if (_controller.state.fullBoard.boardTasks != null &&
        _controller.state.fullBoard.boardTasks!.isNotEmpty) {
      try {
        tasks.addAll(_controller.state.fullBoard.boardTasks!
            .where((task) => task.dateEnd != null && task.dateStart != null)
            .toList());
      } catch (e) {
        // ignore
      }
    }
    return tasks;
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }
}

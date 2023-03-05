import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_event.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/board/widgets/board_list_view.dart';
import 'package:flutter_starter/board_task/controllers/board_task_screen_bloc.dart';
import 'package:flutter_starter/board_task/controllers/board_task_screen_event.dart';
import 'package:flutter_starter/board_task/controllers/board_task_screen_state.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/models/task_label.dart';
import 'package:flutter_starter/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_starter/common/widgets/custom_text_input_widget.dart';
import 'package:flutter_starter/utils/dialog_utils.dart';
import 'package:flutter_starter/utils/time_utils.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class BoardTaskScreen extends StatefulWidget {
  const BoardTaskScreen({Key? key}) : super(key: key);

  @override
  State<BoardTaskScreen> createState() => _BoardTaskScreenState();
}

class _BoardTaskScreenState extends State<BoardTaskScreen> {
  late BoardTaskScreenBloc _boardTaskController;
  String? _taskTitle;
  String? _taskDescription;
  late String _taskListName;
  String? _taskLabelName;
  DateTime? _startTime;
  DateTime? _endTime;
  DateTime? _alarmTime;

  @override
  void initState() {
    super.initState();
    _boardTaskController = context.read<BoardTaskScreenBloc>();
    final boardListId = _boardTaskController.state.boardTask.boardListId;
    _taskListName = _boardTaskController.state.boardLists
        .firstWhere((boardList) => boardList.id == boardListId)
        .name!;
    _taskLabelName = _boardTaskController.state.boardTask.label?.name;

    _startTime = _boardTaskController.state.boardTask.dateStart;
    _endTime = _boardTaskController.state.boardTask.dateStart;

    _taskTitle = _boardTaskController.state.boardTask.title;
    _taskDescription = _boardTaskController.state.boardTask.description;
    // TODO: alarm time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_boardTaskController.state.boardTask?.title ?? ""),
        actions: [
          GestureDetector(
            onTap: _saveBoardTask,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  const Text("save_task").tr(),
                  const Icon(Icons.save),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocListener<BoardTaskScreenBloc, BoardTaskScreenState>(
          listener: (context, state) {
            if (state.saving != null && state.saving == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text("task_saved").tr(),
                  duration: const Duration(seconds: 1),
                ),
              );

              Navigator.pop(context, state.boardTask);
            }
          },
          child: BlocBuilder<BoardTaskScreenBloc, BoardTaskScreenState>(
              builder: (context, state) {
            return CustomCircularProgressIndicator(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              show: state.saving ?? false,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _getBoardListDropdown(),
                      _getTaskLabelDropdown(),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomTextInputWidget([
                            CustomTextInputDetail(
                                onFieldChanged: (value) {
                                  _taskTitle = value.trim();
                                },
                                label: "task_title".tr(),
                                content: _taskTitle,
                                minLines: 1),
                            CustomTextInputDetail(
                                onFieldChanged: (value) {
                                  _taskDescription = value.trim();
                                },
                                label: "task_description".tr(),
                                content: _taskDescription,
                                minLines: 5),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _getStartTask(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _getEndTask(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _getTaskDuration(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _getSetTaskAlarm(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _getBoardListDropdown() {
    List<String?> listNames =
        _boardTaskController.state.boardLists.map((e) => e.name).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("belonged_list").tr(),
          DropdownButton<String?>(
            value: _taskListName,
            elevation: 16,
            onChanged: (String? value) {
              setState(() {
                _taskListName = value!;
              });
            },
            items: listNames.map<DropdownMenuItem<String>>((String? value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value!),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _getTaskLabelDropdown() {
    List<String?> labelNames = TaskLabel.values.map((e) => e.name).toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("task_label").tr(),
          DropdownButton<String?>(
            value: _taskLabelName,
            elevation: 16,
            onChanged: (String? value) {
              setState(() {
                _taskLabelName = value!;
              });
            },
            items: labelNames.map<DropdownMenuItem<String>>((String? value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value!),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _getStartTask() {
    if (_startTime != null) {
      return Center(
        child: Text(
          "${'start_time'.tr()}: ${formatDate(_startTime!)}",
          textAlign: TextAlign.center,
        ),
      );
    }

    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _startTime = DateTime.now();
            });
          },
          child: Text(
            "start_task".tr(),
          ),
        ),
      ),
    );
  }

  Widget _getEndTask() {
    if (_startTime == null) {
      return Container();
    }

    if (_endTime != null) {
      return Center(
        child: Text(
          "${'end_time'.tr()}: ${formatDate(_endTime!)}",
          textAlign: TextAlign.center,
        ),
      );
    }

    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              _endTime = DateTime.now();
            });
          },
          child: Text(
            "finish_task".tr(),
          ),
        ),
      ),
    );
  }

  Widget _getTaskDuration() {
    if (_startTime == null || _endTime == null) {
      return Container();
    }

    return Center(
      child: Text(
        "${'task_duration'.tr()}: ${formatDuration(_endTime!.difference(_startTime!))}",
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _getSetTaskAlarm() {
    return Container();
  }

  void _saveBoardTask() {
    if (_taskTitle == null || _taskTitle!.isEmpty) {
      showSafeDialog(context,
          title: "save_task_error".tr(),
          content: "task_title_cannot_be_empty".tr());
    }

    final boardLists = _boardTaskController.state.boardLists;
    final boardListId = boardLists
        .firstWhere((boardList) => boardList.name == _taskListName)
        .id;

    final taskLabel = _taskLabelName != null
        ? TaskLabel.values.firstWhere((label) => label.value == _taskLabelName)
        : null;

    _boardTaskController.add(
      SaveBoardTask(
        title: _taskTitle!,
        boardListId: boardListId,
        description: _taskDescription,
        label: taskLabel,
        dateStart: _startTime,
        dateEnd: _endTime,
      ),
    );
  }
}

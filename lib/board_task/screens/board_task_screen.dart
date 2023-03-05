import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_event.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/board/widgets/board_list_view.dart';
import 'package:flutter_starter/board_task/controllers/board_task_screen_bloc.dart';
import 'package:flutter_starter/common/models/board_list.dart';
import 'package:flutter_starter/common/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter_starter/common/widgets/custom_text_input_widget.dart';
import 'package:flutter_starter/utils/dialog_utils.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class BoardTaskScreen extends StatefulWidget {
  const BoardTaskScreen({Key? key}) : super(key: key);

  @override
  State<BoardTaskScreen> createState() => _BoardTaskScreenState();
}

class _BoardTaskScreenState extends State<BoardTaskScreen> {
  late BoardTaskScreenBloc _boardTaskController;

  @override
  void initState() {
    super.initState();
    _boardTaskController = context.read<BoardTaskScreenBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/board/controllers/board_screen_state.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/injection.dart';

class BoardScreenBloc extends Bloc<dynamic, BoardScreenState> {
  final IUseCaseBoard _useCaseBoard = locator.get<IUseCaseBoard>();

  BoardScreenBloc(super.initialState);
}

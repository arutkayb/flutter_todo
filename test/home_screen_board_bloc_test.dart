import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_starter/common/repository/use_cases/board/i_use_case_board.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_bloc.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_event.dart';
import 'package:flutter_starter/home/controllers/board_controller/home_screen_board_state.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_test/flutter_test.dart';

import 'util/injection_utils.dart';

main() {
  setUp(() async {
    await configureMock(resetDependencies: true);
  });

  group("Board tasks", () {
    blocTest(
      'Initial state',
      build: () => HomeScreenBoardBloc(HomeScreenBoardState()),
      verify: (bloc) {
        assert(bloc.state.boards.isEmpty);
      },
    );

    blocTest(
      'Board Created',
      build: () => HomeScreenBoardBloc(HomeScreenBoardState()),
      act: (bloc) => bloc.add(BoardCreated('newBoard', 'description')),
      verify: (bloc) {
        assert(bloc.state.boards.isNotEmpty);
        final board = bloc.state.boards[0];
        assert(board.name == 'newBoard');
        assert(board.description == 'description');
      },
    );

    blocTest(
      'Board Fetched',
      build: () => HomeScreenBoardBloc(HomeScreenBoardState()),
      act: (bloc) async {
        final useCaseBoard = locator.get<IUseCaseBoard>();
        await useCaseBoard.createBoard("newBoard", "description");
        bloc.add(FetchBoardsTriggered());
      },
      verify: (bloc) {
        assert(bloc.state.boards.isNotEmpty);
        final board = bloc.state.boards[0];
        assert(board.name == 'newBoard');
        assert(board.description == 'description');
      },
    );

    blocTest(
      'Board Deleted',
      build: () => HomeScreenBoardBloc(HomeScreenBoardState()),
      act: (bloc) async {
        final useCaseBoard = locator.get<IUseCaseBoard>();
        await useCaseBoard.createBoard("newBoard", "description");
        final boards = await useCaseBoard.fetchBoards();
        final board =
            boards.firstWhere((element) => element.name == 'newBoard');
        bloc.add(BoardDeleted(board));
      },
      verify: (bloc) {
        assert(bloc.state.boards.isEmpty);
      },
    );
  });
}

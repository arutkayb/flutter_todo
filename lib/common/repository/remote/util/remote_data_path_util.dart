class RemoteDataPathUtil {
  final boardsDirectory = "boards";
  final boardListsDirectory = "boardLists";
  final boardTasksDirectory = "boardTasks";
  final boardTaskCommentsDirectory = "boardTaskComments";
  final boardTaskAlarmsDirectory = "boardTaskAlarms";
  final String? _rootDirectory;

  RemoteDataPathUtil(String? rootDirectory)
      : _rootDirectory = rootDirectory ?? "";

  String _getRootDirectory() {
    return _rootDirectory != null ? "$_rootDirectory/" : "";
  }

  String getBoardsPath() {
    return "${_getRootDirectory()}$boardsDirectory/";
  }

  String getBoardPath(String boardId) {
    return "${getBoardsPath()}$boardId";
  }

  String getBoardListsPath(String boardId) {
    return "${getBoardPath(boardId)}/$boardListsDirectory/";
  }

  String getBoardListPath(String boardId, String boardListId) {
    return "${getBoardListsPath(boardId)}$boardListId";
  }

  String getBoardTasksPath(String boardId, String boardListId) {
    return "${getBoardListPath(boardId, boardListId)}/$boardTasksDirectory/";
  }

  String getBoardTaskPath(
      String boardId, String boardListId, String boardTaskId) {
    return "${getBoardTasksPath(boardId, boardListId)}$boardTaskId";
  }

  String getBoardTaskAlarmsPath(String boardId, String boardTaskId) {
    return "${_getRootDirectory()}$boardTaskAlarmsDirectory/$boardId/$boardTaskId/";
  }

  String getBoardTaskAlarmPath(
      String boardId, String boardTaskId, String boardTaskAlarmId) {
    return "${getBoardTaskAlarmsPath(boardId, boardTaskId)}$boardTaskAlarmId";
  }

  String getBoardTaskCommentsPath(String boardId, String boardTaskId) {
    return "${_getRootDirectory()}$boardTaskCommentsDirectory/$boardId/$boardTaskId/";
  }

  String getBoardTaskCommentPath(
      String boardId, String boardTaskId, String boardTaskCommentId) {
    return "${getBoardTaskCommentsPath(boardId, boardTaskId)}$boardTaskCommentId";
  }
}

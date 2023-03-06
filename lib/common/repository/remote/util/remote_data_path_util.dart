class RemoteDataPathUtil {
  final usersDirectory = "users";
  final boardsDirectory = "boards";
  final boardListsDirectory = "boardLists";
  final boardTasksDirectory = "boardTasks";
  final boardTaskCommentsDirectory = "boardTaskComments";
  final boardTaskAlarmsDirectory = "boardTaskAlarms";
  final String? _rootDirectory;

  RemoteDataPathUtil(String? rootDirectory)
      : _rootDirectory = rootDirectory ?? "";

  String getRootDirectory() {
    return _rootDirectory != null ? "$_rootDirectory/" : "";
  }

  String getUsersPath() {
    return "${getRootDirectory()}$usersDirectory/";
  }

  String getUserPath(String userId) {
    return "${getUsersPath()}$userId";
  }

  String getBoardsPath() {
    return "${getRootDirectory()}$boardsDirectory/";
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

  String getBoardTasksPath(String boardId) {
    return "${getBoardPath(boardId)}/$boardTasksDirectory/";
  }

  String getBoardTaskPath(String boardId, String boardTaskId) {
    return "${getBoardTasksPath(boardId)}$boardTaskId";
  }

  String getBoardTaskAlarmsPath(String boardId, String boardTaskId) {
    return "${getRootDirectory()}$boardTaskAlarmsDirectory/$boardId/$boardTaskId/";
  }

  String getBoardTaskAlarmPath(
      String boardId, String boardTaskId, String boardTaskAlarmId) {
    return "${getBoardTaskAlarmsPath(boardId, boardTaskId)}$boardTaskAlarmId";
  }

  String getBoardTaskCommentsPath(String boardId, String boardTaskId) {
    return "${getRootDirectory()}$boardTaskCommentsDirectory/$boardId/$boardTaskId/";
  }

  String getBoardTaskCommentPath(
      String boardId, String boardTaskId, String boardTaskCommentId) {
    return "${getBoardTaskCommentsPath(boardId, boardTaskId)}$boardTaskCommentId";
  }
}

class AppError {
  final AppErrorType appErrorType;

  AppError(this.appErrorType);
}

enum AppErrorType { api, network }

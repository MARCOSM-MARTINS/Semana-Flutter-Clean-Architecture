abstract class FailureException implements Exception {}

class InvalidTextError implements FailureException {}

class DataSourceError implements FailureException {
  final String message;

  DataSourceError({this.message});
}

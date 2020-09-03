enum BusinessExceptionType {
  TOKEN_EXPIRED,
  NO_INTERNET,
  NO_FILE_FOUND,
  DEFAULT,
}

enum BusinessExceptionSource {
  REMOTE,
  LOCAL,
  DEFAULT,
}

class BusinessException {
  final BusinessExceptionType type;
  final BusinessExceptionSource source;
  final String msg;

  BusinessException(
      {this.type = BusinessExceptionType.DEFAULT, this.source = BusinessExceptionSource.DEFAULT, this.msg = ''});

  @override
  String toString() {
    return 'BusinessException{type: $type, source: $source, msg: $msg}';
  }
}

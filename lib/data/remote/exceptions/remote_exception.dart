enum RemoteExceptionType {
  /// When opening  url timeout, it occurs.
  CONNECT_TIMEOUT,

  ///It occurs when receiving timeout.
  RECEIVE_TIMEOUT,

  /// It occurs when url is sent timeout.
  SEND_TIMEOUT,

  /// When the server response, but with a incorrect status, such as 404, 503...
  RESPONSE,

  /// When the request is cancelled, dio will throw a error with this type.
  CANCEL,

  /// Default error type, Some other Error. In this case, you can
  /// read the DioError.error if it is not null.
  DEFAULT,
}

class RemoteException implements Exception {
  final RemoteExceptionType type;
  final String msg;

  RemoteException(this.type, {this.msg = ''});

  @override
  String toString() {
    return 'RemoteException{type: $type, msg: $msg}';
  }
}

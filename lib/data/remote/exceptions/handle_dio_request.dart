import 'package:basecleanarchitecture/data/remote/exceptions/remote_exception.dart';
import 'package:dio/dio.dart';

class HandleDioRequest {
  Future<T> handleRequest<T>({Function request}) async {
    try {
      return await request();
    } on DioError catch (e) {
      throw _mapperException(e);
    }
  }

  RemoteException _mapperException(DioError error) {
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        return RemoteException(RemoteExceptionType.CONNECT_TIMEOUT, msg: error.message);
      case DioErrorType.SEND_TIMEOUT:
        return RemoteException(RemoteExceptionType.SEND_TIMEOUT, msg: error.message);
      case DioErrorType.RECEIVE_TIMEOUT:
        return RemoteException(RemoteExceptionType.RECEIVE_TIMEOUT, msg: error.message);
      case DioErrorType.RESPONSE:
        return RemoteException(RemoteExceptionType.RESPONSE, msg: error.message);
      case DioErrorType.CANCEL:
        return RemoteException(RemoteExceptionType.CANCEL, msg: error.message);
      case DioErrorType.DEFAULT:
      default:
        return RemoteException(RemoteExceptionType.DEFAULT, msg: error.message);
    }
  }
}

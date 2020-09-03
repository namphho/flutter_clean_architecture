import 'package:basecleanarchitecture/data/remote/exceptions/remote_exception.dart';

import 'business_exception_mapper.dart';

class BaseRepo {
  final BusinessExceptionMapper _mapper = BusinessExceptionMapper();

  Future<T> handleRequest<T>({Future request()}) async {
    try {
      return await request.call();
	} on RemoteException catch(error){
      throw _mapper.mapFromRemoteException(error);
	}
  }
}
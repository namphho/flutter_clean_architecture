import 'package:basecleanarchitecture/data/remote/exceptions/remote_exception.dart';
import 'package:basecleanarchitecture/domain/exception/business_exception.dart';

class BusinessExceptionMapper{
  BusinessException mapFromRemoteException(RemoteException error){
    //handle for specified case
    return BusinessException(source: BusinessExceptionSource.REMOTE, msg: error.msg);
  }
}
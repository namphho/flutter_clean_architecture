import 'package:basecleanarchitecture/domain/exception/business_exception.dart';

abstract class Observer<T> {
  void onSuccess(T t);

  void onError(BusinessException object);

  void onCancel();
}

import 'package:basecleanarchitecture/domain/exception/business_exception.dart';

abstract class CompletableObserver{
  void onSuccess();

  void onError(BusinessException object);

  void onCancel();
}
import 'package:async/async.dart';

import 'observer.dart';

abstract class UseCase<T, Params> {
  CancelableOperation<T> _operation;

  Future<T> buildRequest(Params params);

  void execute(Observer observer, Params params) async {
    _operation = CancelableOperation.fromFuture(buildRequest(params), onCancel: observer.onCancel);
    _operation.value.then((value) => observer.onSuccess(value),
          onError: (object, _) => observer.onError(object));
  }

  void dispose() {
    print("cancel......");
    _operation.cancel();
  }
}

class IgnoreParam {}

import 'package:async/async.dart';

import 'completable_observer.dart';

abstract class CompletableUseCase<Params>{
  CancelableOperation<void> _operation;

  Future<void> buildRequest(Params params);

  void execute(CompletableObserver observer, Params params) async {
	_operation = CancelableOperation.fromFuture(buildRequest(params));
	_operation.then((value) => observer.onSuccess(),
	  onError: (object, _) => observer.onError(object), onCancel: () => observer.onCancel());
  }

  void dispose() {
	if (!_operation.isCompleted) {
	  _operation.cancel();
	}
  }
}
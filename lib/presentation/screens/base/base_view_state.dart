import 'package:basecleanarchitecture/presentation/screens/base/view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class BaseViewState<VM extends ViewModel, Page extends StatefulWidget> extends State<Page> {
  GlobalKey<State<StatefulWidget>> _globalKey = GlobalKey();
  VM _model;
  VM get model => _model;

  BaseViewState(this._model) {
    _model.init(_globalKey);
    WidgetsBinding.instance.addObserver(_model);
  }

  Widget buildPage(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _model,
      child: buildPage(context),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(_model);
    _model.dispose();
    super.dispose();
  }
}

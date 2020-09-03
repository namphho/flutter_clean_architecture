import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ViewModel with ChangeNotifier, WidgetsBindingObserver {
  GlobalKey<State<StatefulWidget>> _globalKey;

  void init(GlobalKey<State<StatefulWidget>> globalKey) {
    _globalKey = globalKey;
  }

  BuildContext get context {
    assert(_globalKey != null, "should init");
    assert(_globalKey.currentContext != null, "should init");
    return _globalKey.currentContext;
  }

  State<StatefulWidget> get getCurrentState {
    assert(_globalKey != null, "should init");
    assert(_globalKey.currentState != null, "should init");
    return _globalKey.currentState;
  }

  void refreshUI() {
    notifyListeners();
  }

  //add observer to observer life-cycle of page
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        onInActive();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.detached:
        onDetached();
        break;
    }
  }
  /// Called when the application is in an inactive state and is not receiving user input.
  /// On iOS, this state corresponds to an app or the Flutter host view running in
  /// the foreground inactive state. Apps transition to this state when in a phone call,
  /// responding to a TouchID request, when entering the app switcher or the control center,
  /// or when the UIViewController hosting the Flutter app is transitioning.
  /// On Android, this corresponds to an app or the Flutter host view running in
  /// the foreground inactive state. Apps transition to this state when another
  /// activity is focused, such as a split-screen app, a phone call, a
  /// picture-in-picture app, a system dialog, or another window.
  ///
  /// Apps in this state should assume that they may be [onPaused] at any time.
  /// ```dart
  ///     class MyController extends Controller {
  ///       @override
  ///       void onInActive() => print('App is in the background.');
  ///     }
  /// ```
  void onInActive() {}

  /// Called when the application is not currently visible to the user, not responding to user input, and running in the background.
  /// When the application is in this state, the engine will not call the [Window.onBeginFrame] and [Window.onDrawFrame] callbacks.
  /// Android apps in this state should assume that they may enter the [detached] state at any time.
  /// ```dart
  ///     class MyController extends Controller {
  ///       @override
  ///       void onPaused() => print('App is paused.');
  ///     }
  /// ```
  void onPaused() {}

  /// Called when the application is visible and is responding to the user i.e. in the foreground and running.
  /// ```dart
  ///     class MyController extends Controller {
  ///       @override
  ///       void onResumed() => print('App is resumed.');
  ///     }
  /// ```
  void onResumed() {}

  /// Called before the application is detached.
  /// When the application is in this state, the engine still runing but not attached to any view.
  ///
  /// ```dart
  ///     class MyController extends Controller {
  ///       @override
  ///       void onDetached() => print('App is about to detach.');
  ///     }
  /// ```
  void onDetached() {}

//todo observer push & pop
}

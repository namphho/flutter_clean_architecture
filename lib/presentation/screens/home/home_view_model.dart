import 'package:basecleanarchitecture/domain/entites/movie.dart';
import 'package:basecleanarchitecture/domain/exception/business_exception.dart';
import 'package:basecleanarchitecture/domain/usecase/base/completable_observer.dart';
import 'package:basecleanarchitecture/domain/usecase/base/observer.dart';
import 'package:basecleanarchitecture/domain/usecase/base/use_case.dart';
import 'package:basecleanarchitecture/domain/usecase/get_movie_use_case.dart';
import 'package:basecleanarchitecture/presentation/screens/base/view_model.dart';

class HomeViewModel extends ViewModel{
  final GetMovieUseCase _getMovieUseCase;

  HomeViewModel(this._getMovieUseCase);

  void getMovies(){
    _getMovieUseCase.execute(GetMovieObserver(this), IgnoreParam());
  }

  @override
  void dispose() {
    _getMovieUseCase.dispose();
    super.dispose();
  }

  @override
  void onResumed() {
  }

  @override
  void onPaused() {
    _getMovieUseCase.dispose();
  }

  @override
  void onDetached() {
    _getMovieUseCase.dispose();
  }
}

class GetMovieObserver extends Observer<List<Movie>>{
  HomeViewModel model;
  GetMovieObserver(this.model);

  @override
  void onCancel() {
	print("cancel request");
  }

  @override
  void onError(BusinessException err) {
	print("error ${err.toString()}");
  }

  @override
  void onSuccess(List<Movie> t) {
    print("onSuccess");
  }
}

class FakeCompletableObserver extends CompletableObserver{
  @override
  void onCancel() {
    // TODO: implement onCancel
  }

  @override
  void onError(BusinessException object) {
    // TODO: implement onError
  }

  @override
  void onSuccess() {
    // TODO: implement onSuccess
  }

}
import 'package:basecleanarchitecture/domain/entites/movie.dart';
import 'package:basecleanarchitecture/domain/repositories/movie_repo.dart';
import 'package:basecleanarchitecture/domain/usecase/base/use_case.dart';

class GetTopMovieUseCase extends UseCase<List<Movie>, IgnoreParam>{
  final MovieRepo _repo;
  GetTopMovieUseCase(this._repo);

  @override
  Future<List<Movie>> buildRequest(IgnoreParam params) {
    return _repo.getTopMovies();
  }
}
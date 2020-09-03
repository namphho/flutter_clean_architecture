import 'package:basecleanarchitecture/domain/entites/movie.dart';
import 'package:basecleanarchitecture/domain/repositories/movie_repo.dart';
import 'package:basecleanarchitecture/domain/usecase/base/use_case.dart';

class GetMovieUseCase extends UseCase<List<Movie>, IgnoreParam>{
  final MovieRepo movieRepo;
  GetMovieUseCase(this.movieRepo);

  @override
  Future<List<Movie>> buildRequest(IgnoreParam params) {
    return movieRepo.getNowMovies();
  }
}
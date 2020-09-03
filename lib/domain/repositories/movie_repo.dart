import 'package:basecleanarchitecture/domain/entites/movie.dart';

abstract class MovieRepo {
  Future<void> getTopMovies();

  Future<List<Movie>> getNowMovies();
}

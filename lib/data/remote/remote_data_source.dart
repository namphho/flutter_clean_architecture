import 'package:basecleanarchitecture/domain/entites/movie.dart';

abstract class RemoteDataSource{
  Future<List<Movie>> getTopMovies();
  Future<List<Movie>> getNowMovies();
}
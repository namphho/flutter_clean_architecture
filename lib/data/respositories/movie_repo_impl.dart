import 'package:basecleanarchitecture/data/local/local_data_source.dart';
import 'package:basecleanarchitecture/data/remote/remote_data_source.dart';
import 'package:basecleanarchitecture/data/respositories/base_repo.dart';
import 'package:basecleanarchitecture/domain/entites/movie.dart';
import 'package:basecleanarchitecture/domain/repositories/movie_repo.dart';

class MovieRepoImpl extends BaseRepo implements MovieRepo {
  final RemoteDataSource remote;
  final LocalDataSource local;

  MovieRepoImpl(this.remote, this.local);

  @override
  Future<List<Movie>> getNowMovies() {
    return handleRequest<List<Movie>>(request: () {
      return remote.getNowMovies();
    });
  }

  @override
  Future<void> getTopMovies() {
    return handleRequest(request: () {
      return remote.getTopMovies();
    });
  }
}

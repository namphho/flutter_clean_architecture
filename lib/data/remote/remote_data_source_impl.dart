import 'package:basecleanarchitecture/data/remote/data/response/now_play_response.dart';
import 'package:basecleanarchitecture/data/remote/exceptions/handle_dio_request.dart';
import 'package:basecleanarchitecture/data/remote/mappers/movies_mapper.dart';
import 'package:basecleanarchitecture/data/remote/movies/movie_service.dart';
import 'package:basecleanarchitecture/data/remote/remote_data_source.dart';
import 'package:basecleanarchitecture/domain/entites/movie.dart';
import 'package:dio/dio.dart';

class RemoteDataSourceImpl with HandleDioRequest implements RemoteDataSource {
  final MovieService movieService = MovieService(Dio());


  @override
  Future<List<Movie>> getNowMovies(){
    return handleRequest<List<Movie>>(request: () async{
      await Future.delayed(Duration(seconds: 3));
      NowPlayResponse resp = await movieService.getNowPlayingMovies();
      var mapper = MoviesMapper();
      return mapper.nowPlayMapper(resp);
    });
  }

  @override
  Future<List<Movie>> getTopMovies() {
    // TODO: implement getTopMovies
    throw UnimplementedError();
  }


}

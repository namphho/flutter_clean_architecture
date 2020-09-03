import 'package:basecleanarchitecture/data/remote/data/response/now_play_response.dart';
import 'package:basecleanarchitecture/data/remote/movies/rest_client.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: RestClientConstant.BASE_URL)
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET("/movie/now_playing?api_key=7519cb3f829ecd53bd9b7007076dbe23")
  Future<NowPlayResponse> getNowPlayingMovies();
}
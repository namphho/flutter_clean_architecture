import 'package:basecleanarchitecture/data/local/local_data_source.dart';
import 'package:basecleanarchitecture/data/local/local_data_source_impl.dart';
import 'package:basecleanarchitecture/data/remote/remote_data_source.dart';
import 'package:basecleanarchitecture/data/remote/remote_data_source_impl.dart';
import 'package:basecleanarchitecture/data/respositories/movie_repo_impl.dart';
import 'package:basecleanarchitecture/domain/repositories/movie_repo.dart';
import 'package:basecleanarchitecture/domain/usecase/get_movie_use_case.dart';
import 'package:basecleanarchitecture/presentation/screens/home/home_view_model.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  static final _getIt = GetIt.instance;

  static GetIt get instance => _getIt;

  static void setup() {
    _getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
    _getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
    _getIt.registerLazySingleton<MovieRepo>(() => MovieRepoImpl(_getIt<RemoteDataSource>(), _getIt<LocalDataSource>()));

    //use case
    _getIt.registerFactory<GetMovieUseCase>(() => GetMovieUseCase(_getIt<MovieRepo>()));

    //view model
    _getIt.registerFactory<HomeViewModel>(() => HomeViewModel(_getIt<GetMovieUseCase>()));
  }
}

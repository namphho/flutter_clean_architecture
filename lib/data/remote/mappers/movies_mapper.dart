import 'package:basecleanarchitecture/data/remote/data/models/movie_model.dart';
import 'package:basecleanarchitecture/data/remote/data/response/now_play_response.dart';
import 'package:basecleanarchitecture/domain/entites/business_enum_value.dart';
import 'package:basecleanarchitecture/domain/entites/movie.dart';

class MoviesMapper{
  List<Movie> nowPlayMapper(NowPlayResponse resp){
    if (resp.results == null){
      return List(); //or throw
	} else {
      return resp.results.map((e) => _mapperToMovie(e)).toList();
	}
  }

  Movie _mapperToMovie(MovieModel model){
    return Movie()
	  ..id = model.id
	  ..popularity = model.popularity
	  ..voteCount = model.voteCount
	  ..video = model.video
	  ..posterPath = model.posterPath
	  ..adult = model.adult
	  ..backdropPath = model.backdropPath
	  ..originalLanguage = originalLanguageValues.map[model.originalLanguage]
	  ..originalTitle = model.originalTitle
	  ..genreIds = model.genreIds
	  ..title = model.title
	  ..voteAverage = model.voteAverage
	  ..overview = model.overview
	  ..releaseDate = model.releaseDate;
  }
}
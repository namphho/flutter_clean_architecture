import 'package:basecleanarchitecture/data/remote/data/models/dates_model.dart';
import 'package:basecleanarchitecture/data/remote/data/models/movie_model.dart';

class NowPlayResponse {
  NowPlayResponse({
	this.results,
	this.page,
	this.totalResults,
	this.dates,
	this.totalPages,
  });

  List<MovieModel> results;
  int page;
  int totalResults;
  Dates dates;
  int totalPages;

  factory NowPlayResponse.fromJson(Map<String, dynamic> json) => NowPlayResponse(
	results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
	page: json["page"],
	totalResults: json["total_results"],
	dates: Dates.fromJson(json["dates"]),
	totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
	"results": List<dynamic>.from(results.map((x) => x.toJson())),
	"page": page,
	"total_results": totalResults,
	"dates": dates.toJson(),
	"total_pages": totalPages,
  };
}






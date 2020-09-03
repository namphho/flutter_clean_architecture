abstract class LocalDataSource {
  Future getTopMovie();

  Future getNowMovie();

  Future saveTopMovie();

  Future saveNowMovie();
}

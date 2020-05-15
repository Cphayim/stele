class HotMovieData {
  // 评分
  Rating rating;
  // 类别
  List<String> genres;
  // 标题
  String title;
  // 演员
  List<Cast> casts;
  // 人数
  int collectCount;
  // 导演
  List<Cast> directors;
  // 头像
  Avatars images;

  String id;

  HotMovieData();

  // 用来解析 json 的工厂构造函数
  factory HotMovieData.fromJson(Map<String, dynamic> movieDataJson) {
    HotMovieData hotMovieData = HotMovieData();

    Rating rating = Rating(
        movieDataJson['rating']['max'],
        movieDataJson['rating']['min'],
        // average 可能是一个整数，比如 0，需要转为浮点数，否则报类型异常
        double.parse(movieDataJson['rating']['average'].toString()));
    hotMovieData.rating = rating;

    List<String> genres = [];
    for (String genre in movieDataJson['genres']) {
      genres.add(genre);
    }
    hotMovieData.genres = genres;

    hotMovieData.title = movieDataJson['title'];

    List<Cast> casts = [];
    try {
      for (dynamic castData in movieDataJson['casts']) {
        Avatars avatars = Avatars(castData['avatars']['small'],
            castData['avatars']['large'], castData['avatars']['medium']);
        Cast cast =
            Cast(castData['alt'], avatars, castData['name'], castData['id']);
        casts.add(cast);
      }
    } catch (e) {}
    hotMovieData.casts = casts;

    hotMovieData.collectCount = movieDataJson['collect_count'];

    List<Cast> directors = [];
    try {
      for (dynamic castData in movieDataJson['directors']) {
        Avatars avatars = Avatars(castData['avatars']['small'],
            castData['avatars']['large'], castData['avatars']['medium']);
        Cast cast =
            Cast(castData['alt'], avatars, castData['name'], castData['id']);
        directors.add(cast);
      }
    } catch (e) {}
    hotMovieData.directors = directors;

    hotMovieData.images = Avatars(movieDataJson['images']['small'],
        movieDataJson['images']['large'], movieDataJson['images']['medium']);

    hotMovieData.id = movieDataJson['id'];

    return hotMovieData;
  }

  String getCasts() {
    return casts.map((cast) => cast.name).join('/');
  }

  String getDirectors() {
    return directors.map((director) => director.name).join('/');
  }
}

class Rating {
  int max;
  int min;
  double average;

  Rating(this.max, this.min, this.average);
}

class Cast {
  String alt;
  Avatars avatars;
  String name;
  String id;

  Cast(this.alt, this.avatars, this.name, this.id);
}

class Avatars {
  String small;
  String large;
  String medium;

  Avatars(this.small, this.large, this.medium);
}

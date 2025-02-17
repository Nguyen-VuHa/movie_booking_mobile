class MovieDetail {
  final String movieId;
  final String slug;
  final String title;
  final int duration;
  final String startDate;
  final String endDate;
  final String description;
  final String trailerId;
  final String director;
  final String poster;
  final String actors;
  final String categories;

  // Constructor
  MovieDetail({
    required this.movieId,
    required this.slug,
    required this.title,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.trailerId,
    required this.director,
    required this.poster,
    required this.actors,
    required this.categories,
  });

  // Chuyển từ JSON -> Object
  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      movieId: json['movie_id'],
      slug: json['slug'],
      title: json['title'],
      duration: json['duration'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      description: json['description'],
      trailerId: json['trailer_id'],
      director: json['director'],
      poster: json['poster'],
      actors: json['actors'],
      categories: json['categories'],
    );
  }

  // Chuyển từ Object -> JSON
  Map<String, dynamic> toJson() {
    return {
      'movie_id': movieId,
      'slug': slug,
      'title': title,
      'duration': duration,
      'start_date': startDate,
      'end_date': endDate,
      'description': description,
      'trailer_id': trailerId,
      'director': director,
      'poster': poster,
      'actors': actors,
      'categories': categories,
    };
  }
}

class MovieResponse {
  final List<MovieDetail> showing;
  final List<MovieDetail> comming_soon;

  MovieResponse({
    required this.showing,
    required this.comming_soon,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      showing: (json['showing'] as List<dynamic>?)
              ?.map((e) => MovieDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [], // Nếu null thì trả về danh sách rỗng
      comming_soon: (json['comming_soon'] as List<dynamic>?)
              ?.map((e) => MovieDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [], // Nếu null thì trả về danh sách rỗng
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'showing': showing.map((e) => e.toJson()).toList(),
      'comming_soon': comming_soon.map((e) => e.toJson()).toList(),
    };
  }
}
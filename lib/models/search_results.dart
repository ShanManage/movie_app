class Search {
  List<Movie>? movies;
  String? totalResults;
  String? response;

  Search.name();

  Search({this.movies, this.totalResults, this.response});

  Search.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      movies = <Movie>[];
      json['Search'].forEach((v) {
        movies!.add(new Movie.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['Search'] = this.movies!.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = this.totalResults;
    data['Response'] = this.response;
    return data;
  }
}

class Movie {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  Movie({this.title, this.year, this.imdbID, this.type, this.poster});

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'] != "N/A"
        ? json['Poster']
        : "https://wiki.tripwireinteractive.com/images/4/47/Placeholder.png";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    return data;
  }
}

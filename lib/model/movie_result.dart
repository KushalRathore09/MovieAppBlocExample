
class Result {
  Movie movie ;
  Result({this.movie});

  Result.fromJson(Map<String,dynamic>json){
    movie = json['result'] != null ? new Movie.fromJson(json['result']) : null ;
  }

  Map<String,dynamic>toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.movie != null){
      data['result']=this.movie.toJson();
    }
    return data ;
  }
}


class Movie {
  String title ;
  String originalTitle ;
  String posterPath ;
  String releaseDate ;
  String overview ;

  Movie({this.title , this.originalTitle,this.posterPath,this.releaseDate,this.overview});

  Movie.fromJson(Map<String,dynamic>json){
    title =json["title"];
    originalTitle = json["original_title"];
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    overview = json["overview"];
  }

  Map<String,dynamic>toJson(){
    final Map<String,dynamic>data = new Map<String,dynamic>();
    data["title"] = this.title ;
    data["original_title"] = this.originalTitle ;
    data["poster_path"] = this.posterPath ;
    data["release_date"] = this.releaseDate ;
    data["overview"] = this.overview ;
    return data ;
  }
}
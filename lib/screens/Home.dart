import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app/apiClient/movie_apiClient.dart';
import 'package:movie_app/model/movie_result.dart';
import 'package:movie_app/utils/colors.dart';
import 'package:movie_app/utils/string_resources.dart';


class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  MovieApiClient _movieApiClient ;
  List<Movie>_movieList = [] ;

  @override
  void initState(){
    super.initState() ;
    _getAllMovie();
  }


  void _getAllMovie() async{

    Response movieResponse =await _movieApiClient.fetchMovie() ;
    if(movieResponse != null && movieResponse.body != null){
      dynamic responseData =jsonDecode(movieResponse.body);
      if(movieResponse.statusCode == 200){
        Movie movie = Movie.fromJson(responseData);
        setState(() {
          _movieList = movie as List<Movie> ;
        });
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBodyWidget(context),
    );
  }

  Widget _buildAppBar(BuildContext context){
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.DarkColor),
      elevation: 0.0,
      backgroundColor: AppColors.PrimaryColor,
      centerTitle: true,
      leading: Image.asset("assets/images/movieDb.png", height: 20, width: 20),
      title: Text(
        'Movie DB',
        style: TextStyle(color: AppColors.DarkColor),
      ),
      actions: <Widget>[
        Container(
            margin: const EdgeInsets.only(right: 10.0, left: 10.0),
            child: Icon(
              Icons.search,
              color: AppColors.LightBlack,
              size: 20,
            ))
      ],
    );
  }

  Widget _buildBodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
        child: ListView.builder(itemBuilder: (context , int index){
          return _buildListItemWidget(_movieList[index]);
        },itemCount: _movieList.length,),
      ),
    );
  }

  Widget _buildListItemWidget(Movie movie) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "/detail");
        },
        child: Card(
          margin: const EdgeInsets.only(bottom: 5.0,top: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top:10.0,bottom: 10.0,right: 10.0,left: 10.0),
                child: Image.network(movie.posterPath),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30,bottom: 30,right: 10.0,left: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Text(
                          movie.originalTitle ?? "",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: AppColors.LightBlack,
                              fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                      child: Container(
                          margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            movie.overview ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15.0,
                                color: AppColors.LightBlack,),
                          )),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Text(
                          movie.releaseDate ?? "",
                          style: TextStyle(
                              fontSize: 14.0,
                              color: AppColors.GrayLite,),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

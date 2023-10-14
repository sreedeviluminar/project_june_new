import 'dart:math';
import 'package:flutter/material.dart';
import 'package:project_june1/statemanagement_using_provider/model/movies.dart';

final List<Movies> movieList = List.generate(
    100,
    (index) => Movies(
        title: 'Movie $index',
        time: '${Random().nextInt(100) + 60} minutes'));

class MovieProvider extends ChangeNotifier  {

 final List<Movies> _movie = movieList;
 List<Movies> get movies => _movie; //value from _movie accessible through this get property

final List<Movies> _wishListMovie = [];
List<Movies> get moviesWishList => _wishListMovie;

void addtoWishList(Movies movieFromMainPage){
  _wishListMovie.add(movieFromMainPage);
  notifyListeners();
}

 void removeFromWishList(Movies removedMovie){
   _wishListMovie.remove(removedMovie);
   notifyListeners();
 }


}
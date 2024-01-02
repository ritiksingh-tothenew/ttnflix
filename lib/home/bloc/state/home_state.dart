import 'package:ttnflix/home/model/movie_list.dart';
import 'package:ttnflix/utils/default_equatable.dart';

abstract class HomeState extends DefaultEquatable {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final MovieListModel movieData;

  HomeLoaded(this.movieData);
}

class HomeEmpty extends HomeState {}

class HomeError extends HomeState {
  final String errorMessage;

  HomeError(this.errorMessage);
}

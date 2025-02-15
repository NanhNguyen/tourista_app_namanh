import 'package:flutter/material.dart';
import 'package:tourista_app/data/database.dart';

@immutable
class HomeState {
  final List<TravelPlace> places;
  final List<TravelPlace> favoritePlaces;
  const HomeState({
    this.places = const [],
    this.favoritePlaces = const [],
  });
  HomeState copyWith(
      {List<TravelPlace>? places, List<TravelPlace>? favoritePlaces}) {
    return HomeState(
        favoritePlaces: favoritePlaces ?? this.favoritePlaces,
        places: places ?? this.places);
  }
}

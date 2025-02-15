import 'package:flutter/material.dart';
import 'package:tourista_app/data/database.dart';

@immutable
class PlaceState {
  final TravelPlace? place;
  const PlaceState({this.place});
  PlaceState copyWith({TravelPlace? place}) {
    return PlaceState(place: place ?? this.place);
  }
}

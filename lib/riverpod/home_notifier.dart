import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourista_app/data/database.dart';
import 'package:tourista_app/riverpod/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState(places: travelPlaces));
  void onClickToChangeTheBookMark(int index) {
    List<TravelPlace> placesAfterClicked = state.places.map((item) {
      if (state.places[index].id == item.id) {
        return item.copyWith(save: !item.save);
      }
      return item;
    }).toList();

    List<TravelPlace> favPlaces =
        placesAfterClicked.where((item) => item.save).toList();

    state =
        state.copyWith(places: placesAfterClicked, favoritePlaces: favPlaces);
  }
}

final homeStateNotifierProvider =
    StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

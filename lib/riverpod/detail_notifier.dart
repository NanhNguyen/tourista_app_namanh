import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourista_app/riverpod/detail_state.dart';

class DetailNotifier extends StateNotifier<PlaceState> {
  DetailNotifier() : super(const PlaceState());
  setPlaceState(value) {
    state = state.copyWith(place: value);
  }

  void onClick() {
    state = state.copyWith(
        place: state.place?.copyWith(save: !(state.place?.save ?? false)));
  }
}

final detailStateNotifierProvider =
    StateNotifierProvider<DetailNotifier, PlaceState>((ref) {
  return DetailNotifier();
});

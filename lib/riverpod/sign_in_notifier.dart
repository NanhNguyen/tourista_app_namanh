import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourista_app/riverpod/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(const SignInState());
  void togglePassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }
}

final signInStateNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>((ref) {
  return SignInNotifier();
});

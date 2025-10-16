import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourista_app/riverpod/sign_in_state.dart';

class SignUpNotifier extends StateNotifier<SignInState> {
  SignUpNotifier() : super(const SignInState());
  void togglePassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }
}

final signUpStateNotifierProvider =
    StateNotifierProvider<SignUpNotifier, SignInState>((ref) {
  return SignUpNotifier();
});

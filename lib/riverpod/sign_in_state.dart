import 'package:flutter/material.dart';

@immutable
class SignInState {
  final bool showPassword;
  const SignInState({this.showPassword = true});
  SignInState copyWith({bool? showPassword}) {
    return SignInState(showPassword: showPassword ?? this.showPassword);
  }
}

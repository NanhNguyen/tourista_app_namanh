import 'package:flutter/material.dart';

@immutable
class SignUpState {
  final bool showPassword;
  const SignUpState({this.showPassword = true});
  SignUpState copyWith({bool? showPassword}) {
    return SignUpState(showPassword: showPassword ?? this.showPassword);
  }
}

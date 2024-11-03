import 'package:firebase_auth/firebase_auth.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final User user;

  SignupSuccess({required this.user});
}
class SignupFailure extends SignupState {
  final String error;

  SignupFailure({required this.error});
}

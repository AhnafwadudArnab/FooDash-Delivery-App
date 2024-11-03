import 'package:equatable/equatable.dart';

abstract class LogIn_Event extends Equatable {
  const LogIn_Event();

  @override
  List<Object> get props => [];
}

// Event for when the signup button is pressed
class SignupButtonPressed extends LogIn_Event {
  final String email;
  final String password;

  const SignupButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

// Event for when the signup form is submitted with additional fields


import 'package:firebase_auth/firebase_auth.dart';

abstract class Login_State {}

class login_Initial extends Login_State {}

class login_Loading extends Login_State {}

class login_Success extends Login_State {
  final User user;

  login_Success({required this.user});
}
class login_Failure extends Login_State {
  final String error;

  login_Failure({required this.error});
}

class loginSuccess extends Login_State{
  final UserCredential userCredential;
  loginSuccess({required this.userCredential});
List<Object?> get props => [userCredential];
}
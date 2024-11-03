import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Pages/Login_Signup/Login.dart';
import 'LoginEvent.dart';
import 'logInState.dart';

class LoginBloc extends Bloc<LogIn_Event, Login_State> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  LoginBloc() : super(login_Initial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(login_Loading());
      try {
        final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
            email: event.email, 
            password: event.password
        );
        if (userCredential.user != null) {
          emit(login_Success(user: userCredential.user!));
        } else {
          emit(login_Failure(error: "Invalid user data!"));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          emit(login_Failure(error: "The email address is already in use by another account."));
        } else {
          emit(login_Failure(error: e.toString()));
        }
      } catch (e) {
        emit(login_Failure(error: e.toString()));
      }
    });

    on<LoginSubmitted>((event, emit) async {
      emit(login_Loading());
      try {
        final UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: event.email, 
            password: event.password
        );
        if (userCredential.user != null) {
          emit(login_Success(user: userCredential.user!));
        } else {
          emit(login_Failure(error: "Invalid user data!"));
        }
      } catch (e) {
        emit(login_Failure(error: e.toString()));
      }
    });
  }
}

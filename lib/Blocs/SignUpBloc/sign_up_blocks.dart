import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Pages/Login_Signup/sign_up.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  SignUpBloc() : super(SignupInitial()) {
    on<SignupButtonPressed>((event, emit) async {
      emit(SignupLoading());
      try {
        final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
            email: event.email, 
            password: event.password
            );
        if (userCredential.user != null) {
          emit(SignupSuccess(user: userCredential.user!));
        } else {
          emit(SignupFailure(error: "Invalid user data!"));
        }
      } catch (e) {
        emit(SignupFailure(error: e.toString()));
      }
    });

    on<SignupSubmitted>((event, emit) async {
      emit(SignupLoading());
      try {
        final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
            email: event.email, password: event.password);
        if (userCredential.user != null) {
          emit(SignupSuccess(user: userCredential.user!));
        } else {
          emit(SignupFailure(error: "Invalid user data!"));
        }
      } catch (e) {
        emit(SignupFailure(error: e.toString()));
      }
    });
  }
}
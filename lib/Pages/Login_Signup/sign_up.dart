
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fooduu/Blocs/SignUpBloc/sign_up_event.dart';

import '../../Blocs/SignUpBloc/sign_up_blocks.dart';
import '../../Blocs/SignUpBloc/sign_up_state.dart';
import '../../utils/dimensions.dart';
import 'Login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            // Gradient background
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.red,
                    Colors.orange,
                  ],
                ),
              ),
            ),
            // White container for form fields
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3.6),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimension.radius40),
                  topRight: Radius.circular(Dimension.radius40),
                ),
              ),
            ),
            // FooDash picture and form fields
            Container(
              margin: const EdgeInsets.only(top: 22.0, left: 20.0, right: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/icons/logo6-.png",
                        width: MediaQuery.of(context).size.width / 1.8,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: Dimension.height40),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        height: MediaQuery.of(context).size.height / 1.85,//box size//
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                        ),
                        child: const SignUpForm(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signup successful!')),
          );
          // Navigate to the login screen after successful signup
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        } else if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Signup failed: ${state.error}')),
          );
        }
      },
      child: BlocBuilder<SignUpBloc, SignupState>(
        builder: (context, state) {
          if (state is SignupLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SignupFormWidget();
        },
      ),
    );
  }

  Widget SignupFormWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          // Name field
          TextFormField(
            controller: nameTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Name";
              }
              return null;
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: "Name",
            ),
          ),
          const SizedBox(height: 20),
          // Email field
          TextFormField(
            controller: emailTextController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Email";
              } else if (!EmailValidator.validate(value)) {
                return "Invalid Email!";
              }
              return null;
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              hintText: "Email",
            ),
          ),
          // Password field
          SizedBox(height: Dimension.height20),
          TextFormField(
            obscureText: isVisible,
            controller: passwordTextController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Password";
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: isVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              prefixIcon: const Icon(Icons.password_outlined),
              hintText: "Password",
            ),
          ),
          // Sign Up button with loading indicator
          SizedBox(height: Dimension.height30),
          BlocBuilder<SignUpBloc, SignupState>(
            builder: (context, state) {
              if (state is SignupLoading) {
                return const CircularProgressIndicator();
              }
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffff5722), // Background color
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                  ),
                  minimumSize: Size(Dimension.width200, 40), // Adjust height as needed
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<SignUpBloc>().add(
                      SignupSubmitted(
                        name: nameTextController.text,
                        email: emailTextController.text,
                        password: passwordTextController.text,
                      ) as SignupEvent,
                    );
                  }
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: Dimension.font26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Poopins1",
                  ),
                ),
              );
            },
          ),
          // Already have an account? Sign in button
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: Dimension.width4),
                Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: Dimension.font20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Event class for SignupSubmitted
class SignupSubmitted extends SignupEvent {
  final String name;
  final String email;
  final String password;

  const SignupSubmitted({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}

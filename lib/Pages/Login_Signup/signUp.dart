import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import 'Login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _isLoading = false; // To indicate the loading state
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isvisible = true;
  // Simulated sign-up action (replace with actual API call)
  Future<void> performSignUp(String name, String email, String password) async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      // Simulate a delay (e.g., waiting for API response)
      await Future.delayed(const Duration(seconds: 2));

      // Here, you'd normally perform your API call to register the user
      // e.g., calling Firebase, or making an HTTP request to your server
      // If sign-up succeeds, navigate to a different screen or show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up successful, welcome $name!')),
      );

      // Navigate to the login screen after successful signup
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    } catch (error) {
      // Handle errors, such as network issues or validation failures
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up failed: $error')),
      );
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red,
                  AppColor.mainColor,
                ],
              ),
            ),
          ),
          // Form container
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
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
          // Form elements
          Container(
            margin: const EdgeInsets.only(top: 22.0, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Logo
                  Center(
                    child: Image.asset(
                      "assets/icons/logo6-.png",
                      width: MediaQuery.of(context).size.width / 1.8,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: Dimension.height45),

                  // Form with validation
                  Form(
                    key: _formKey,
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimension.radius20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: Dimension.height20),
                            // Sign Up Title
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: Dimension.font26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: Dimension.height20),

                            // Name Field
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                hintText: "Name",
                                prefixIcon: Icon(Icons.person_2_outlined),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: Dimension.height20),

                            // Email Field
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.email_outlined),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: Dimension.height20),

                            // Password Field
                            TextFormField(
                              controller: _passwordController,
                              obscureText: !_passwordVisible,
                              decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.password_outlined),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: isvisible ? Colors.grey : Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: Dimension.height45),

                            // Sign Up Button
                            _isLoading
                                ? const CircularProgressIndicator()
                                : Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(
                                        Dimension.radius20),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7.0),
                                      width: Dimension.width200,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffff5722),
                                        borderRadius: BorderRadius.circular(
                                            Dimension.radius20),
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              // Call the signup action
                                              performSignUp(
                                                _nameController.text,
                                                _emailController.text,
                                                _passwordController.text,
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
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(height: Dimension.height45),

                            // Login Prompt
                            GestureDetector(
                              onTap: () {
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
                                  GestureDetector(
                                    onTap: () {
                                      // Navigate to login screen
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Login(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                        fontSize: Dimension.font20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

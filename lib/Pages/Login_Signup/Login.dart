import 'package:FooDash_App/Pages/Login_Signup/signUp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../Downbar/BottomNavigationButtons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  bool isvisible = true;
  bool _isLoading = false; // To show loading state

  // Simulated login action (replace with actual API call)
  Future<void> performLogin(String email, String password) async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      // Simulate a delay (e.g., waiting for API response)
      await Future.delayed(const Duration(seconds: 2));

      // Here, you'd normally perform your API call to login the user
      // If login succeeds, navigate to a different screen or show success message
      if (email == "user@example.com" && password == "password123") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );

        // Navigate to the home page or desired screen after successful login
        Get.offAll(() => const CustomBottomNavigationBar());
      } else {
        // Show error if login fails
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    } catch (error) {
      // Handle errors, such as network issues or server problems
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $error')),
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
      body: Container(
        child: Stack(
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
                    AppColor.mainColor,
                  ],
                ),
              ),
            ),
            // White container for form fields
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimension.radius40),
                  topRight: Radius.circular(Dimension.radius40),
                ),
              ),
              child: const Text(""),
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
                    SizedBox(height: Dimension.height45),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      child: Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Dimension.radius20),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: Dimension.height20),
                              Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: Dimension.font26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: Dimension.height20),
                              // Email field
                              TextFields(emailTextController: emailTextController),
                              // Password field
                              SizedBox(height: Dimension.height20),
                              Container(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextFormField(
                                  obscureText: isvisible,
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
                                          isvisible = !isvisible;
                                        });
                                      },
                                      icon: isvisible
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility),
                                      color: isvisible ? Colors.grey : Colors.black,
                                    ),

                                    prefixIcon: const Icon(Icons.password_outlined),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      fontSize: Dimension.font26,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              // Forget password button
                              SizedBox(height: Dimension.height20),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                    fontSize: Dimension.font20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: Dimension.height45),
                              // Login button
                              _isLoading
                                  ? const CircularProgressIndicator()
                                  : ElevatedButton(
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
                                    // Perform login action
                                    performLogin(
                                      emailTextController.text,
                                      passwordTextController.text,
                                    );
                                    // Navigate to CustomBottomNavigationBar
                                    Get.offAll(() => const MyHomePage());
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: Dimension.font26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: "Poopins1",
                                  ),
                                ),
                              ),
                              // Sign up link
                              SizedBox(height: Dimension.height52),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Signup()),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Don't have an account? ",
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
                                            builder: (context) => const Signup(),
                                          ),
                                        );
                                      },
                                      child:Text(
                                        "Sign up",
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
      ),
    );
  }
}

class TextFields extends StatefulWidget {
  final TextEditingController emailTextController;

  const TextFields({super.key, required this.emailTextController});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email text field
        Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextFormField(
            controller: widget.emailTextController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Email";
              } else {
                final bool isValid = EmailValidator.validate(widget.emailTextController.text);
                if (!isValid) {
                  return "Email was entered incorrectly!";
                }
                return null;
              }
            },
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(
                fontSize: Dimension.font26,
                color: Colors.black,
              ),
              prefixIcon: const Icon(Icons.email_outlined),
            ),
          ),
        ),
      ],
    );
  }
}

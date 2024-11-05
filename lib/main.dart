import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooduu/Blocs/LoginBloc/LogIn_Bloc.dart';
import 'package:fooduu/Pages/Home_pages/BottomNavigationButtons.dart';
import 'package:get/get.dart';
import '../Routes/routess.dart';
import 'Blocs/SignUpBloc/sign_up_blocks.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    log('Invalid Error! $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
      BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(),
      ),
      ],
     child:  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FooDash',
      theme: ThemeData.light(), // Light theme
      themeMode: ThemeMode.system, // Automatically switch themes based on system setting
      home:  MyHomePage(),
      // home: Onboard(),
      initialRoute: RoutesHelper.initial,
      getPages: RoutesHelper.routes,
    ),
    );
  }
}
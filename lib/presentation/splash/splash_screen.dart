import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mindlink_blog/logic/cubits/blog_cubit/blog_cubit.dart';
import 'package:mindlink_blog/logic/cubits/blog_cubit/blog_state.dart';

import 'package:mindlink_blog/presentation/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = "Splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void gotoNextScreen() {
   
  
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => gotoNextScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlogCubit, BlogState>(
      listener: (context, state) {
        gotoNextScreen();
      },
      child:  AnimatedSplashScreen(duration:10000 ,
        splash: Center(
          child: Lottie.asset(
              'assets/animated/Animation - 1722927455635.json', fit: BoxFit.fitHeight),
        ),
       nextScreen: const SizedBox(),//because CubitState is handling navigation
        
        ));
  } 
}

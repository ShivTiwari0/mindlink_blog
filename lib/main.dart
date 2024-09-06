import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mindlink_blog/core/routes.dart';
import 'package:mindlink_blog/core/ui.dart';
import 'package:mindlink_blog/logic/cubits/blog_cubit/blog_cubit.dart';
import 'package:mindlink_blog/logic/cubits/text_cubit/text_cubit.dart';
import 'package:mindlink_blog/logic/cubits/video_cubit.dart/video_cubit.dart';

import 'package:mindlink_blog/presentation/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  runApp(const MindLink());
}

class MindLink extends StatelessWidget {
  const MindLink({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlogCubit(),
        ),
        BlocProvider(
          create: (context) => VideoCubit(),
        ),
        BlocProvider(
          create: (context) => TextCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenrateRoute,
        theme: Themes.defaultTheme,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log("Created: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in $bloc: $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in $bloc: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    super.onClose(bloc);
  }
}

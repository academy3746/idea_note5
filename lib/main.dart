import 'package:flutter/material.dart';
import 'package:idea_note5/data/idea_info.dart';
import 'package:idea_note5/features/edit_screen/edit_screen.dart';
import 'package:idea_note5/features/main_screen/main_screen.dart';
import 'package:idea_note5/features/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아이디어노트',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        primaryColor: Colors.amberAccent,
        useMaterial3: false,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == EditScreen.routeName) {
          final IdeaInfo? ideaInfo = settings.arguments as IdeaInfo?;

          return MaterialPageRoute(
            builder: (BuildContext context) {
              return EditScreen(ideaInfo: ideaInfo);
            },
          );
        }
        return null;
      },
    );
  }
}

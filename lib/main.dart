import 'package:flutter/material.dart';
import 'package:spalsh/pages/login.dart';
import 'package:spalsh/pages/splash.dart';
import 'package:spalsh/pages/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter splash',
      // home: const WelcomePage(),
      home: const SplashPage(),
      // home: const LoginPage(),
      debugShowCheckedModeBanner: false,

      // 全局主题
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData( // ElevatedButton 主题
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange, // 按钮背景色
            elevation: 0, // 阴影
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // 圆角
            ),
          ),
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

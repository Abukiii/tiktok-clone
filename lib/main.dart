import 'package:flutter/material.dart';
import 'package:video_app/controller/viewController.dart';
import 'package:video_app/screens/home_page.dart';
import 'package:video_app/shared/theme_data.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme(),
      home: ChangeNotifierProvider(
        create: (context) => ViewController(),
        child: HomeScreen(),
      ),
    );
  }
}

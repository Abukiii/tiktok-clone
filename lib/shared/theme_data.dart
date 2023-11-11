import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      textTheme: _customTextTheme(),
      // Add other theme configurations as needed
    );
  }

  Color bottomNavigationBar = Color(0xFF2E2E2E);
  Color ActiveIcon = Color(0xFFFFDD55);
  Color InActiveIcon = Color(0xFFFFFFFF);
  Color more = Color(0xFF2CCAA0);
  Color time = Color(0xFFE5A5A5);
  Color overlay = Color(0xFFFA8989);

  Color commentUserColor = Color(0xFF000000);
  Color commentLinkColor = Color(0xFF5C8DFF);
  Color commentTimeColor = Color(0xFFC4C4C4);
  Color commentTextColor = Color(0xFF767676);
  Color commentIconColor = Color(0xFFC4C4C4);
  Color numberOfCommentsColor = Color(0xFF5F6368);
  Color black = Color.fromARGB(255, 0, 0, 0);
  Color white = Color.fromARGB(255, 255, 255, 255);
  Color captionback = Color(0xFF4C4243);

  Color replyname = Color(0xFFFFBB00);
  Color lineInreply = Color(0xFF886826);

  static TextTheme _customTextTheme() {
    return TextTheme(
      displayLarge: TextStyle(fontFamily: 'Roboto', fontSize: 24.0),
      displayMedium: TextStyle(fontFamily: 'Roboto', fontSize: 22.0),
      displaySmall: TextStyle(fontFamily: 'Roboto', fontSize: 20.0),
      headlineMedium: TextStyle(fontFamily: 'Roboto', fontSize: 18.0),
      headlineSmall: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      titleLarge: TextStyle(fontFamily: 'Roboto', fontSize: 14.0),
      titleMedium: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      titleSmall: TextStyle(fontFamily: 'Roboto', fontSize: 14.0),
      bodyLarge: TextStyle(fontFamily: 'Roboto', fontSize: 18.0),
      bodyMedium: TextStyle(fontFamily: 'Roboto', fontSize: 16.0),
      bodySmall: TextStyle(fontFamily: 'Roboto', fontSize: 14.0),
      labelLarge: TextStyle(fontFamily: 'Roboto', fontSize: 14.0),
      labelSmall: TextStyle(fontFamily: 'Roboto', fontSize: 10.0),
    );
  }
}

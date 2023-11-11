import 'package:flutter/material.dart';
import 'package:video_app/shared/theme_data.dart';

PreferredSizeWidget CustomAppBar() {
  return AppBar(
    backgroundColor: AppTheme().white,
    elevation: 0, // No shadow
    toolbarHeight: 50.0, // Set the height to 31
    automaticallyImplyLeading: false,

    title: Row(
      children: [
        Image.asset(
          'assets/images/image.png',
          height: 30,
          width: 30,
        ),
        SizedBox(width: 8),
        Text(
          'SeeQul',
          style: TextStyle(fontSize: 16, color: AppTheme().black),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            'assets/images/right.png',
            height: 20,
            width: 20,
          ),
        ),
      ],
    ),
    actions: [
      InkWell(
          child: Image.asset(
        'assets/images/search.png',
        height: 20,
        width: 20,
      )),
      SizedBox(
        width: 20,
      ),
      InkWell(
          child: Image.asset(
        'assets/images/filter.png',
        height: 20,
        width: 20,
      )),
      SizedBox(
        width: 30,
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:video_app/shared/theme_data.dart';

Widget CommetTextField(context) {
  return Container(
    child: Row(children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/image4.jpg'),
          radius: 25,
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
            // color: Colors.black,
            border: Border.all(
              color: AppTheme().commentIconColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.emoji_emotions_outlined,
                      color: AppTheme().commentIconColor, size: 30),
                ),
                Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add Comment',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: TextStyle(color: AppTheme().black)),
                ),
                Icon(Icons.send, color: AppTheme().commentLinkColor, size: 30),
              ],
            ),
          ),
        ),
      )
    ]),
  );
}

import 'package:flutter/material.dart';
import 'package:video_app/Model/comment.dart';
import 'package:video_app/screens/widgets/commentWidget.dart';
import 'package:video_app/screens/widgets/commetTextField.dart';
import 'package:video_app/shared/theme_data.dart';

class ReplyScreen extends StatelessWidget {
  const ReplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Reply",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppTheme().black,
                                  fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        comment(
                            Samplecomments[0].commentText,
                            Samplecomments[0].name,
                            Samplecomments[0].username,
                            Samplecomments[0].time,
                            Samplecomments[0].profilePictureUrl,
                            context,
                            false,
                            false),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Replying to",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: AppTheme().black,
                                          fontWeight: FontWeight.bold)),
                              Text(
                                " John Doe @JohntheD",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: AppTheme().ActiveIcon,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        CommetTextField(context)
                      ],
                    ),
                    Positioned(
                        left: 30,
                        top: 55,
                        child: Container(
                          color: Colors.black,
                          width: 2,
                          height: 125,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

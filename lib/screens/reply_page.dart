import 'package:flutter/material.dart';
import 'package:video_app/Model/comment.dart';
import 'package:video_app/controller/viewController.dart';
import 'package:video_app/screens/widgets/appBar.dart';
import 'package:video_app/screens/widgets/commentWidget.dart';
import 'package:video_app/screens/widgets/commetTextField%20Withemoji.dart';
import 'package:video_app/screens/widgets/commetTextField.dart';
import 'package:video_app/screens/widgets/emojiPicker.dart';
import 'package:video_app/shared/theme_data.dart';
import 'package:provider/provider.dart';

class ReplyScreen extends StatelessWidget {
  const ReplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewProvider = Provider.of<ViewController>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            'assets/images/back.png', // Replace with the actual path to your book icon
                            height: 25,
                            width: 25,
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
                  GestureDetector(
                    onTap: () {
                      if (viewProvider.emoji) {
                        viewProvider.hideEmoji();
                      }
                    },
                    child: Stack(
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
                                            color: AppTheme().replyname,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            CommentWithEmoji(),
                          ],
                        ),
                        Positioned(
                            left: 32,
                            top: 58,
                            child: Container(
                              color: AppTheme().lineInreply,
                              width: 2,
                              height: 120,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

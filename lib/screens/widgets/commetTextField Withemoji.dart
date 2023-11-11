import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:video_app/controller/viewController.dart';
import 'package:video_app/shared/theme_data.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:provider/provider.dart';

class CommentWithEmoji extends StatefulWidget {
  const CommentWithEmoji({super.key});

  @override
  State<CommentWithEmoji> createState() => _CommentWithEmojiState();
}

class _CommentWithEmojiState extends State<CommentWithEmoji> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      final viewProvider = Provider.of<ViewController>(context, listen: false);
      if (_focusNode.hasFocus) {
        // The text field gained focus, hide emoji
        viewProvider.hideEmoji();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewProvider = Provider.of<ViewController>(context);
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(children: [
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
                  height: MediaQuery.of(context).viewInsets.bottom + 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            viewProvider.emoji
                                ? viewProvider.hideEmoji()
                                : viewProvider.showEmoji();
                          },
                          child: Icon(
                              viewProvider.emoji
                                  ? Icons.keyboard
                                  : Icons.emoji_emotions_outlined,
                              color: AppTheme().commentIconColor,
                              size: 30),
                        ),
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              hintText: 'Add Comment',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            style: TextStyle(color: AppTheme().black),
                            focusNode: _focusNode,
                          ),
                        ),
                        Image.asset(
                          'assets/images/send.png', // Replace with the actual path to your telegram icon
                          height: 30,
                          width: 30,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
            viewProvider.emoji
                ? SizedBox(
                    height: 400,
                    child: EmojiPicker(
                      // onEmojiSelected: (Category? category, Emoji? emoji) {
                      //   if (emoji != null) {
                      //     _textEditingController.text += emoji.emoji;
                      //possible to do action on press
                      //     _focusNode.unfocus();
                      //   }
                      // },
                      onBackspacePressed: () {
                        String currentText = _textEditingController.text;

                        if (currentText.isNotEmpty) {
                          _textEditingController.text =
                              currentText.substring(0, currentText.length - 1);
                        }
                      },
                      textEditingController: _textEditingController,
                      config: Config(
                        columns: 7,
                        emojiSizeMax: 32 *
                            (foundation.defaultTargetPlatform ==
                                    TargetPlatform.iOS
                                ? 1.30
                                : 1.0),
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        gridPadding: EdgeInsets.zero,
                        initCategory: Category.RECENT,
                        bgColor: Color(0xFFF2F2F2),
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        backspaceColor: Colors.blue,
                        skinToneDialogBgColor: Colors.white,
                        skinToneIndicatorColor: Colors.grey,
                        enableSkinTones: true,
                        recentTabBehavior: RecentTabBehavior.RECENT,
                        recentsLimit: 28,
                        noRecents: const Text(
                          'No Recents',
                          style: TextStyle(fontSize: 20, color: Colors.black26),
                          textAlign: TextAlign.center,
                        ),
                        loadingIndicator: const SizedBox.shrink(),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL,
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}

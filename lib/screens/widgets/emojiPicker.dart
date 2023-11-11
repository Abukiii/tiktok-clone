import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

class EmojiPickerExample extends StatefulWidget {
  @override
  _EmojiPickerExampleState createState() => _EmojiPickerExampleState();
}

class _EmojiPickerExampleState extends State<EmojiPickerExample> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hide the emoji picker when tapped outside
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Emoji Picker Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.emoji_emotions),
                    onPressed: () {
                      _toggleEmojiPicker();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: EmojiPicker(
                  onEmojiSelected: (Category? category, Emoji? emoji) {
                    if (emoji != null) {
                      // Append the selected emoji to the text field
                      _textEditingController.text += emoji.emoji;

                      // Hide the emoji picker
                      _focusNode.unfocus();
                    }
                  },
                  onBackspacePressed: () {
                    String currentText = _textEditingController.text;

                    if (currentText.isNotEmpty) {
                      _textEditingController.text =
                          currentText.substring(0, currentText.length - 1);
                    }
                  },
                  textEditingController:
                      _textEditingController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
                  config: Config(
                    columns: 7,
                    emojiSizeMax: 32 *
                        (foundation.defaultTargetPlatform == TargetPlatform.iOS
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleEmojiPicker() {
    if (!_focusNode.hasFocus) {
      _focusNode.requestFocus();
    } else {
      _focusNode.unfocus();
    }
  }
}

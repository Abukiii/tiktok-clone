import 'package:flutter/material.dart';
import 'package:video_app/Model/comment.dart';
import 'package:video_app/controller/viewController.dart';
import 'package:video_app/screens/widgets/commentWidget.dart';
import 'package:video_app/screens/widgets/commetTextField.dart';
import 'package:video_app/shared/theme_data.dart';
import 'package:provider/provider.dart';

class OptionsScreen extends StatefulWidget {
  String caption;
  String time;

  OptionsScreen({Key? key, required this.caption, required this.time})
      : super(key: key);

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    final viewProvider = Provider.of<ViewController>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFFC4C4C4)
                          .withOpacity(0.3), // Adjust opacity as needed
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (widget.caption.length > 150)
                                showMore
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            showMore = !showMore;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: const Row(
                                            children: [
                                              Text(
                                                '...Less',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                              Icon(
                                                Icons.arrow_upward,
                                              )
                                            ],
                                          ),
                                        ))
                                    : SizedBox(),
                            ],
                          ),
                          Text(
                            widget.caption,
                            maxLines: showMore ? null : 3,
                            overflow: showMore
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: showMore ? 20.0 : 16.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.time,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey),
                              ),
                              if (widget.caption.length > 150)
                                !showMore
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            showMore = !showMore;
                                          });
                                        },
                                        child: Container(
                                          color: Colors.black.withOpacity(0.2),
                                          child: const Row(
                                            children: [
                                              Text(
                                                '...More',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                              Icon(
                                                Icons.arrow_upward,
                                              )
                                            ],
                                          ),
                                        ))
                                    : SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/image4.jpg'),
                        radius: 20,
                      ),
                      const SizedBox(height: 20),
                      const Icon(Icons.book),
                      const SizedBox(height: 20),
                      IconButton(
                        icon: const Icon(Icons.comment),
                        onPressed: () {
                          showBottomSheett(context);
                        },
                      ),
                      const Text('601k'),
                      const SizedBox(height: 20),
                      const Icon(Icons.favorite),
                      const Text('1123'),
                      const SizedBox(height: 20),
                      const Icon(Icons.share),
                      // Transform(
                      //   transform: Matrix4.rotationZ(5.8),
                      //   child: Icon(Icons.send),
                      // ),
                      const SizedBox(height: 50),
                      GestureDetector(
                          onTap: () {
                            print("Hello");
                            viewProvider.makefullscreen();
                          },
                          child: const Icon(Icons.arrow_back)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void showBottomSheett(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: FractionallySizedBox(
            heightFactor: 0.6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: AppTheme().numberOfCommentsColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('45k comments'),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: Samplecomments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: comment(
                                Samplecomments[index].commentText,
                                Samplecomments[index].name,
                                Samplecomments[index].username,
                                Samplecomments[index].time,
                                Samplecomments[index].profilePictureUrl,
                                context,
                                Samplecomments[index].reply,
                                true));
                      },
                    ),
                  ),
                  //Spacer(),
                  Divider(
                    thickness: 1,
                    color: AppTheme().commentIconColor,
                  ),
                  CommetTextField(context)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

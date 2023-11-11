import 'package:flutter/material.dart';
import 'package:video_app/Model/comment.dart';
import 'package:video_app/controller/viewController.dart';
import 'package:video_app/screens/widgets/commentWidget.dart';
import 'package:video_app/screens/widgets/commetTextField%20Withemoji.dart';
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
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),

                      border: Border.all(
                        color: AppTheme()
                            .commentTimeColor, // Set the border color here
                      ),
                      color: AppTheme()
                          .captionback
                          .withOpacity(0.6), // Adjust opacity as needed
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
                                          child: Row(
                                            children: [
                                              Text(
                                                '...Less',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                              Image.asset(
                                                'assets/images/down.png', // Replace with the actual path to your book icon
                                                height: 15,
                                                width: 20,
                                              ),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: AppTheme().time,
                                        fontWeight: FontWeight.bold),
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
                                          child: Row(
                                            children: [
                                              Text(
                                                '...More',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                              Image.asset(
                                                'assets/images/up.png', // Replace with the actual path to your book icon
                                                height: 15,
                                                width: 20,
                                              ),
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
                      InkWell(
                        onTap: () {
                          // Your onPressed action here
                        },
                        child: Image.asset(
                          'assets/images/book.png', // Replace with the actual path to your book icon
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          showBottomSheett(context);
                        },
                        child: Image.asset(
                          'assets/images/Vector(5).png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Text('45k'),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          // Your onPressed action here
                        },
                        child: Image.asset(
                          'assets/images/likeh.png', // Replace with the actual path to your book icon
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Text('45K'),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          // Your onPressed action here
                        },
                        child: Image.asset(
                          'assets/images/share.png', // Replace with the actual path to your book icon
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                          onTap: () {
                            viewProvider.makefullscreen();
                          },
                          child: Image.asset(
                            'assets/images/full.png',
                            height: 60,
                            width: 60,
                          )),
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
              child: Stack(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 80),
                    child: ListView.builder(
                      shrinkWrap: true,
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
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Divider(
                          thickness: 1,
                          color: AppTheme().commentIconColor,
                        ),
                        //CommetTextField(context)
                        ChangeNotifierProvider(
                            create: (context) => ViewController(),
                            child: CommentWithEmoji())
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

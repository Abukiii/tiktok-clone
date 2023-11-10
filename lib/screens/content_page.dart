import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_app/controller/viewController.dart';
import 'package:video_app/screens/options_page.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

class ContentScreen extends StatefulWidget {
  var url;
  String caption;
  String time;

  ContentScreen(
      {Key? key, required this.url, required this.caption, required this.time})
      : super(key: key);

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(widget.url);
    await videoPlayerController.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        showControls: false);
    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewProvider = Provider.of<ViewController>(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        chewieController != null &&
                chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onTap: () {},
                child: Chewie(
                  controller: chewieController!,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        viewProvider.fulscreen
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child:
                    OptionsScreen(caption: widget.caption, time: widget.time),
              ),
      ],
    );
  }
}

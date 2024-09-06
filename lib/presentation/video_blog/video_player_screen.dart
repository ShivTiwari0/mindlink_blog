import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:mindlink_blog/core/ui.dart';
import 'package:mindlink_blog/data/model/video_model.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoModel videoModel;
  const VideoPlayerScreen({super.key, required this.videoModel});

  static const routeName = "VideoPlayer";

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late CustomVideoPlayerController _controller;

  Uri videoUrl = Uri.parse(
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  void initializeVideoPlayer() {
    VideoPlayerController _videoPlayerController;
    _videoPlayerController = VideoPlayerController.networkUrl(videoUrl)
      ..initialize().then((value) => setState(() {}));
    _controller = CustomVideoPlayerController(
        context: context, videoPlayerController: _videoPlayerController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
     
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomVideoPlayer(customVideoPlayerController: _controller),
          const SizedBox(height: 16,),

          Text(widget.videoModel.title!, style: TextStyles.heading3,),

          const SizedBox(height: 16,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(widget.videoModel.description!, style: TextStyles.body2,),
             ),

        ],
      ),
    );
  }
}

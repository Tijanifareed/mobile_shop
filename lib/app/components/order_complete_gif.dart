import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GifVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const GifVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _GifVideoPlayerState createState() => _GifVideoPlayerState();
}

class _GifVideoPlayerState extends State<GifVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        _controller.setLooping(false);
        _controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
        : CircularProgressIndicator();
  }
}

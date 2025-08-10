import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

class VideoCallPage extends StatelessWidget {
  final Call call;

  const VideoCallPage({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamCallContainer(
        call: call,

        onBackPressed: () {
          call.leave();
        },
        onLeaveCallTap: () {
          call.leave();
          Navigator.pop(context);
        },
      ),
    );
  }
}

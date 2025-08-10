import 'package:flutter/material.dart';
import 'package:stream_video_app/Feature/home/presentation/screens/join_rooms.dart';
import 'package:stream_video_app/core/theme/app_theme.dart';

class MeetingApp extends StatelessWidget {
  const MeetingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meeting App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: JoinRoom(),
    );
  }
}

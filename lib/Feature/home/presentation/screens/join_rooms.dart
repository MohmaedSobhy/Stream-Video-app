import 'package:flutter/material.dart';
import 'package:stream_video_app/Feature/home/presentation/controller/join_meeting_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_video_app/Feature/home/presentation/widgets/custome_text_field.dart';
import 'package:stream_video_app/Feature/video/presentation/screens/video_call_screen.dart';

class JoinRoom extends StatefulWidget {
  const JoinRoom({super.key});

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  late final JoinMeetingCubit joinMeetingCubit;

  @override
  void initState() {
    joinMeetingCubit = JoinMeetingCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => joinMeetingCubit,
      child: Scaffold(
        appBar: AppBar(title: Text("Meeting App"), centerTitle: true),
        body: BlocListener<JoinMeetingCubit, JoinMeetingState>(
          listener: (context, state) {
            if (state is SuccessJoinMeetingState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return VideoCallPage(call: state.call);
                  },
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: joinMeetingCubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  const Spacer(),
                  CustomeTextField(
                    controller: joinMeetingCubit.userName,
                    hint: "Your Name",
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Name Required";
                      }
                      final nameRegExp = RegExp(r"^[a-zA-Z ]{4,25}$");
                      if (!nameRegExp.hasMatch(value.toString())) {
                        return "Enter a valid name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (joinMeetingCubit.formKey.currentState!.validate()) {
                          joinMeetingCubit.joinMeeting();
                        }
                      },

                      child: BlocBuilder<JoinMeetingCubit, JoinMeetingState>(
                        builder: (context, state) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child:
                                (state is LoadingJoinMeetingState)
                                    ? Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                    : Text(
                                      'Join Test Room',
                                      style: TextStyle(fontSize: 16),
                                    ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:stream_video_app/core/utils/errors_messages.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

part 'join_meeting_state.dart';

class JoinMeetingCubit extends Cubit<JoinMeetingState> {
  JoinMeetingCubit() : super(JoinMeetingInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();

  Future<void> joinMeeting() async {
    emit(LoadingJoinMeetingState());
    try {
      await _initStreamVideo();
      Call call = await _joinCall();
      emit(SuccessJoinMeetingState(call));
    } catch (error) {
      emit(FailedJoinMeetingState(error.toString()));

      return;
    }
  }

  Future<void> _initStreamVideo() async {
    try {
      StreamVideo.reset();
      StreamVideo(
        "mmhfdzb5evj2",
        user: User.regular(
          userId: "Pollen_Swallow",
          name: userName.text.toString(),
          role: 'admin',
        ),
        userToken:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL3Byb250by5nZXRzdHJlYW0uaW8iLCJzdWIiOiJ1c2VyL1BvbGxlbl9Td2FsbG93IiwidXNlcl9pZCI6IlBvbGxlbl9Td2FsbG93IiwidmFsaWRpdHlfaW5fc2Vjb25kcyI6NjA0ODAwLCJpYXQiOjE3NTQ2NjI4NDEsImV4cCI6MTc1NTI2NzY0MX0.mWfTON74lmhxCENGBqGqG3CV1FX_yaIys2UKSJ-kFHc",
      );
    } catch (error, stack) {
      log("Error message ${stack.toString()}");
      throw Exception(ErrorsMessages.invalidCredentials);
    }
  }

  Future<Call> _joinCall() async {
    try {
      final call = StreamVideo.instance.makeCall(
        callType: StreamCallType.defaultType(),
        id: "mGkCGyeFVql7ybKHlRM2v",
      );

      await call.getOrCreate();
      await call.join();
      return call;
    } catch (error, stack) {
      log("Error message ${stack.toString()}");
      throw Exception(ErrorsMessages.accessDenied);
    }
  }
}

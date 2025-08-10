part of 'join_meeting_cubit.dart';

@immutable
sealed class JoinMeetingState {}

final class JoinMeetingInitial extends JoinMeetingState {}

final class LoadingJoinMeetingState extends JoinMeetingState {}

final class FailedJoinMeetingState extends JoinMeetingState {
  final String error;

  FailedJoinMeetingState(this.error);
}

final class SuccessJoinMeetingState extends JoinMeetingState {
  final Call call;

  SuccessJoinMeetingState(this.call);
}

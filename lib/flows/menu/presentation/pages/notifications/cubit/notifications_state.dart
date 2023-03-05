part of 'notifications_cubit.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState({
    required this.notifications,
  });

  final List<ChangeNotification> notifications;

  @override
  List<Object> get props => [notifications];
}

class NotificationsLoading extends NotificationsState {
  const NotificationsLoading({required super.notifications});
}

class NotificationsLoaded extends NotificationsState {
  const NotificationsLoaded({required super.notifications});
}

class NotificationsError extends NotificationsState {
  const NotificationsError({
    required super.notifications,
    required this.failure,
  });
  final Failure failure;
}

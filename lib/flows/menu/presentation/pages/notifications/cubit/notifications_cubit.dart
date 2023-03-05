import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hackint/domain/core/errors/failures.dart';
import 'package:hackint/flows/complete_registration/domain/entities/group.dart';
import 'package:hackint/flows/main/domain/entities/change_notification.dart';
import 'package:hackint/flows/main/domain/usecase/get_notifications.dart';
import 'package:injectable/injectable.dart';

part 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.getNotificationsUseCase)
      : super(const NotificationsLoading(notifications: []));
  final GetNotificationsUseCase getNotificationsUseCase;

  Future<void> getNotifications(Group group) async {
    final result = await getNotificationsUseCase(group);
    result.fold((failure) {
      emit(
        NotificationsError(
          notifications: state.notifications,
          failure: failure,
        ),
      );
    }, (notifications) {
      notifications.sort(
        (a, b) => b.dateTime.compareTo(a.dateTime),
      );
      emit(
        NotificationsLoaded(
          notifications: notifications,
        ),
      );
    });
  }
}

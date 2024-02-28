import 'dart:io';

import 'package:absen_app/activity/data/model/activity.dart';
import 'package:absen_app/activity/domain/usecases/add_activity.dart';
import 'package:absen_app/activity/domain/usecases/delete_activity.dart';
import 'package:absen_app/activity/domain/usecases/delete_file.dart';
import 'package:absen_app/activity/domain/usecases/edit_activity.dart';
import 'package:absen_app/activity/domain/usecases/fetch_user_activity.dart';
import 'package:absen_app/activity/domain/usecases/get_activity_by_id.dart';
import 'package:absen_app/activity/domain/usecases/store_file.dart';
import 'package:absen_app/auth/presentation/presentation_provider.dart';
import 'package:absen_app/common/constants.dart';
import 'package:absen_app/common/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:uuid/uuid.dart';
import 'package:absen_app/common/key.dart';

class ActivityNotifier extends StateNotifier<ActivityState> {
  final AddActivity _addActivity;
  final DeleteActivity _deleteActivity;
  final EditActivity _editActivity;
  final FetchUserActivity _fetchUserActivity;
  final GetActivityById _getActivityById;
  final DeleteFile _deleteFile;
  final StoreFile _storeFile;
  final Ref _ref;

  ActivityNotifier({
    required AddActivity addActivityUseCase,
    required DeleteActivity deleteActivityUseCase,
    required EditActivity editActivityUseCase,
    required FetchUserActivity fetchUserActivityUseCase,
    required GetActivityById getActivityByIdUseCase,
    required DeleteFile deleteFileUseCase,
    required StoreFile storeFileUseCase,
    required Ref ref,
  })  : _addActivity = addActivityUseCase,
        _deleteActivity = deleteActivityUseCase,
        _editActivity = editActivityUseCase,
        _fetchUserActivity = fetchUserActivityUseCase,
        _getActivityById = getActivityByIdUseCase,
        _deleteFile = deleteFileUseCase,
        _storeFile = storeFileUseCase,
        _ref = ref,
        super(const ActivityState.initial()) {
    fetchUserActivity();
  }

  void addActivity({
    required BuildContext context,
    required String title,
    required String description,
    required DateTime date,
    required File? file,
  }) async {
    state = state.copyWith(state: EnumState.loading);
    String activityId = const Uuid().v1();
    final user = _ref.read(authNotifierProvider).userData!;
    final imageRes = await _storeFile.execute('activity', activityId, file);

    imageRes.fold(
      (l) {
        state = state.copyWith(state: EnumState.failure, message: l.message);
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) async {
        final Activity activity = Activity(
          id: activityId,
          uid: user.uid,
          title: title,
          description: description,
          date: date,
          documentation: r,
        );

        final res = await _addActivity.execute(activity);
        res.fold(
          (l) {
            state =
                state.copyWith(state: EnumState.failure, message: l.message);
            snackbarKey.currentState
                ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
          },
          (r) {
            state = state.copyWith(state: EnumState.loaded);
            snackbarKey.currentState?.showSnackBar(
                showSnackBarWithoutContextGreen("Activity added successfully"));
            fetchUserActivity();
            Routemaster.of(context).pop();
          },
        );
      },
    );
  }

  void deleteActivity(Activity activity) async {
    state = state.copyWith(state: EnumState.loading);
    final imageRes = await _deleteFile.execute('activity', activity.id);
    final res = await _deleteActivity.execute(activity);

    imageRes.fold(
      (l) {
        state = state.copyWith(
          state: EnumState.failure,
          message: l.message,
        );
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) => res.fold(
        (l) {
          state = state.copyWith(
            state: EnumState.failure,
            message: l.message,
          );
          snackbarKey.currentState
              ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
        },
        (r) {
          state = state.copyWith(state: EnumState.loaded);
          snackbarKey.currentState?.showSnackBar(
              showSnackBarWithoutContextRed("Delete activity successfully"));
          fetchUserActivity();
        },
      ),
    );
  }

  void editActivity({
    required File? file,
    required Activity activity,
    required BuildContext context,
  }) async {
    state = state.copyWith(state: EnumState.loading);
    if (file != null) {
      final imageRes = await _storeFile.execute('activity', activity.id, file);

      imageRes.fold(
        (l) {
          state = state.copyWith(
            state: EnumState.failure,
            message: l.message,
          );
          snackbarKey.currentState
              ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
        },
        (r) => activity = activity.copyWith(documentation: r),
      );
    }

    final res = await _editActivity.execute(activity);
    res.fold(
      (l) {
        state = state.copyWith(
          state: EnumState.failure,
          message: l.message,
        );
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) {
        state = state.copyWith(state: EnumState.loaded, activity: null);
        fetchUserActivity();
        Routemaster.of(context).pop();
      },
    );
  }

  void fetchUserActivity() async {
    state = state.copyWith(state: EnumState.loading);
    final uid = _ref.read(authNotifierProvider).userData!.uid;
    final res = await _fetchUserActivity.execute(uid);

    res.fold(
      (l) {
        state = state.copyWith(
          state: EnumState.failure,
          message: l.message,
        );
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) {
        state = state.copyWith(
          state: EnumState.loaded,
          activityList: r,
          activity: null,
        );
      },
    );
  }

  void getActivityById(String activityId) async {
    state = state.copyWith(state: EnumState.loading);
    final res = await _getActivityById.execute(activityId);

    res.fold(
      (l) {
        state = state.copyWith(
          state: EnumState.failure,
          message: l.message,
        );
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) {
        state = state.copyWith(
          state: EnumState.loaded,
          activity: r,
        );
      },
    );
  }
}

class ActivityState {
  final List<Activity> activityList;
  final Activity? activity;
  final EnumState state;
  final String message;

  const ActivityState({
    this.activityList = const [],
    this.activity,
    this.state = EnumState.initial,
    this.message = '',
  });

  const ActivityState.initial({
    this.activityList = const [],
    this.activity,
    this.state = EnumState.initial,
    this.message = '',
  });

  ActivityState copyWith({
    List<Activity>? activityList,
    Activity? activity,
    EnumState? state,
    String? message,
  }) {
    return ActivityState(
      activityList: activityList ?? this.activityList,
      activity: activity ?? this.activity,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }
}

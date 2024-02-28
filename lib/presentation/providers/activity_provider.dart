import 'dart:io';

import 'package:absen_app/presentation/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:uuid/uuid.dart';

import 'package:absen_app/common/key.dart';
import 'package:absen_app/common/utils.dart';
import 'package:absen_app/data/datasources/activity_remote_datasource.dart';
import 'package:absen_app/data/datasources/activity_storage_datasource.dart';
import 'package:absen_app/data/models/activity.dart';
import 'package:absen_app/data/repositories/activity_repository_impl.dart';
import 'package:absen_app/domain/usecases/add_activity.dart';
import 'package:absen_app/domain/usecases/delete_activity.dart';
import 'package:absen_app/domain/usecases/delete_file.dart';
import 'package:absen_app/domain/usecases/edit_activity.dart';
import 'package:absen_app/domain/usecases/fetch_user_activity.dart';
import 'package:absen_app/domain/usecases/get_activity_by_id.dart';
import 'package:absen_app/domain/usecases/store_file.dart';
import 'package:absen_app/presentation/providers/firebase_provider.dart';

class ActivityController extends StateNotifier<ActivityState> {
  final AddActivity _addActivity;
  final DeleteActivity _deleteActivity;
  final EditActivity _editActivity;
  final FetchUserActivity _fetchUserActivity;
  final DeleteFile _deleteFile;
  final StoreFile _storeFile;
  final Ref _ref;

  ActivityController({
    required AddActivity addActivityUseCase,
    required DeleteActivity deleteActivityUseCase,
    required EditActivity editActivityUseCase,
    required FetchUserActivity fetchUserActivityUseCase,
    required DeleteFile deleteFileUseCase,
    required StoreFile storeFileUseCase,
    required Ref ref,
  })  : _addActivity = addActivityUseCase,
        _deleteActivity = deleteActivityUseCase,
        _editActivity = editActivityUseCase,
        _fetchUserActivity = fetchUserActivityUseCase,
        _deleteFile = deleteFileUseCase,
        _storeFile = storeFileUseCase,
        _ref = ref,
        super(const ActivityState.initial());

  void addActivity({
    required BuildContext context,
    required String title,
    required String description,
    required DateTime date,
    required File? file,
  }) async {
    state = state.copyWith(state: ActivityEnumState.loading);
    String activityId = const Uuid().v1();
    final user = _ref.read(userProvider)!;
    final imageRes = await _storeFile.execute('activity', activityId, file);

    imageRes.fold(
      (l) {
        state = state.copyWith(
          state: ActivityEnumState.failure,
          message: l.message,
        );
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContext(l.message));
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
            state = state.copyWith(
              state: ActivityEnumState.failure,
              message: l.message,
            );
            snackbarKey.currentState
                ?.showSnackBar(showSnackBarWithoutContext(l.message));
          },
          (r) {
            state = state.copyWith(state: ActivityEnumState.loaded);
            snackbarKey.currentState?.showSnackBar(
                showSnackBarWithoutContext("Activity added successfully"));
            Routemaster.of(context).pop();
          },
        );
      },
    );
  }

  void deleteActivity(Activity activity) async {
    state = state.copyWith(state: ActivityEnumState.loading);
    final imageRes = await _deleteFile.execute('activity', activity.id);
    final res = await _deleteActivity.execute(activity);

    imageRes.fold(
      (l) {
        state = state.copyWith(
          state: ActivityEnumState.failure,
          message: l.message,
        );
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContext(l.message));
      },
      (r) => res.fold(
        (l) {
          state = state.copyWith(
            state: ActivityEnumState.failure,
            message: l.message,
          );
          snackbarKey.currentState
              ?.showSnackBar(showSnackBarWithoutContext(l.message));
        },
        (r) {
          state = state.copyWith(state: ActivityEnumState.loaded);
          snackbarKey.currentState?.showSnackBar(
              showSnackBarWithoutContext("Delete activity successfully"));
        },
      ),
    );
  }

  void editActivity({
    required File? file,
    required Activity activity,
    required BuildContext context,
  }) async {
    state = state.copyWith(state: ActivityEnumState.loading);
    if (file != null) {
      final imageRes = await _storeFile.execute('activity', activity.id, file);

      imageRes.fold(
        (l) {
          state = state.copyWith(
            state: ActivityEnumState.failure,
            message: l.message,
          );
          snackbarKey.currentState
              ?.showSnackBar(showSnackBarWithoutContext(l.message));
        },
        (r) => activity = activity.copyWith(documentation: r),
      );
    }

    final res = await _editActivity.execute(activity);
    res.fold(
      (l) {
        state = state.copyWith(
          state: ActivityEnumState.failure,
          message: l.message,
        );
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContext(l.message));
      },
      (r) {
        state = state.copyWith(state: ActivityEnumState.loaded);
        Routemaster.of(context).pop();
      },
    );
  }

  void fetchUserActivity() {
    final uid = _ref.read(userProvider)!.uid;
    final res = _fetchUserActivity.execute(uid);

    res.fold(
      (l) {
        state = state.copyWith(
          state: ActivityEnumState.failure,
          message: l.message,
        );
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContext(l.message));
      },
      (r) async {
        state = state.copyWith(
          state: ActivityEnumState.loaded,
          activityList: await r.first,
        );
      },
    );
  }
}

final activityRemoteDataSourceProvider = Provider(
  (ref) => ActivityRemoteDatasource(
    firestore: ref.watch(firestoreProvider),
  ),
);

final activityStorageDataSourceProvider = Provider(
  (ref) => ActivityStorageDatasource(
    storage: ref.watch(storageProvider),
  ),
);

final activityRepositoryProvider = Provider(
  (ref) => ActivityRepositoryImpl(
    activityRemoteDatasource: ref.watch(activityRemoteDataSourceProvider),
    activityStorageDatasource: ref.watch(activityStorageDataSourceProvider),
  ),
);

final addActivityProvider = Provider(
  (ref) => AddActivity(ref.watch(activityRepositoryProvider)),
);

final deleteActivityProvider = Provider(
  (ref) => DeleteActivity(ref.watch(activityRepositoryProvider)),
);

final editActivityProvider = Provider(
  (ref) => EditActivity(ref.watch(activityRepositoryProvider)),
);

final fetchUserActivityProvider = Provider(
  (ref) => FetchUserActivity(ref.watch(activityRepositoryProvider)),
);

final getActivityByIdProvider = Provider(
  (ref) => GetActivityById(ref.watch(activityRepositoryProvider)),
);

final deleteFileProvider = Provider(
  (ref) => DeleteFile(ref.watch(activityRepositoryProvider)),
);

final storeFileProvider = Provider(
  (ref) => StoreFile(ref.watch(activityRepositoryProvider)),
);

final activityControllerProvider =
    StateNotifierProvider<ActivityController, ActivityState>(
  (ref) {
    return ActivityController(
      addActivityUseCase: ref.watch(addActivityProvider),
      editActivityUseCase: ref.watch(editActivityProvider),
      deleteActivityUseCase: ref.watch(deleteActivityProvider),
      fetchUserActivityUseCase: ref.watch(fetchUserActivityProvider),
      deleteFileUseCase: ref.watch(deleteFileProvider),
      storeFileUseCase: ref.watch(storeFileProvider),
      ref: ref,
    );
  },
);

enum ActivityEnumState {
  initial,
  loading,
  loaded,
  failure,
}

class ActivityState {
  final List<Activity> activityList;
  final ActivityEnumState state;
  final String message;

  const ActivityState({
    this.activityList = const [],
    this.state = ActivityEnumState.initial,
    this.message = '',
  });

  const ActivityState.initial({
    this.activityList = const [],
    this.state = ActivityEnumState.initial,
    this.message = '',
  });

  ActivityState copyWith({
    List<Activity>? activityList,
    ActivityEnumState? state,
    String? message,
  }) {
    return ActivityState(
      activityList: activityList ?? this.activityList,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }
}

import 'package:absen_app/activity/data/data_provider.dart';
import 'package:absen_app/activity/domain/usecases/add_activity.dart';
import 'package:absen_app/activity/domain/usecases/delete_activity.dart';
import 'package:absen_app/activity/domain/usecases/delete_file.dart';
import 'package:absen_app/activity/domain/usecases/edit_activity.dart';
import 'package:absen_app/activity/domain/usecases/fetch_user_activity.dart';
import 'package:absen_app/activity/domain/usecases/get_activity_by_id.dart';
import 'package:absen_app/activity/domain/usecases/store_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

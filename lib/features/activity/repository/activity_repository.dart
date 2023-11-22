import 'package:absen_app/common/constants.dart';
import 'package:absen_app/common/failure.dart';
import 'package:absen_app/common/type_def.dart';
import 'package:absen_app/model/activity_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';

class ActivityRepository {
  final FirebaseFirestore _firestore;

  ActivityRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _activities =>
      _firestore.collection(Constants.activitiesCollection);

  FutureVoid addActivity(Activity activity) async {
    try {
      return right(_activities.doc(activity.id).set(activity.toMap()));
    } on FirebaseException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<Activity>> fetchUserActivity(String uid) => _activities
      .where('uid', isEqualTo: uid)
      .orderBy('date', descending: true)
      .snapshots()
      .map(
        (event) => event.docs
            .map((e) => Activity.fromMap(e.data() as Map<String, dynamic>))
            .toList(),
      );

  FutureVoid deleteActivity(Activity activity) async {
    try {
      return right(_activities.doc(activity.id).delete());
    } on FirebaseException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<Activity> getActivityById(String activityId) =>
      _activities.doc(activityId).snapshots().map(
            (event) => Activity.fromMap(event.data() as Map<String, dynamic>),
          );
}

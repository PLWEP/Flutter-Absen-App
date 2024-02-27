import 'package:absen_app/common/constants.dart';
import 'package:absen_app/common/exception.dart';
import 'package:absen_app/data/models/activity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityRemoteDatasource {
  final FirebaseFirestore _firestore;
  ActivityRemoteDatasource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _activities =>
      _firestore.collection(Constants.activitiesCollection);

  Future<void> addActivity(Activity activity) async {
    try {
      await _activities.doc(activity.id).set(activity.toJson());
    } catch (e) {
      throw ServerException();
    }
  }

  Stream<List<Activity>> fetchUserActivity(String uid) {
    try {
      return _activities
          .where('uid', isEqualTo: uid)
          .orderBy('date', descending: true)
          .snapshots()
          .map(
            (event) => event.docs
                .map((e) => Activity.fromJson(e.data() as Map<String, dynamic>))
                .toList(),
          );
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> deleteActivity(Activity activity) async {
    try {
      await _activities.doc(activity.id).delete();
    } catch (e) {
      throw ServerException();
    }
  }

  Stream<Activity> getActivityById(String activityId) {
    try {
      return _activities.doc(activityId).snapshots().map(
            (event) => Activity.fromJson(event.data() as Map<String, dynamic>),
          );
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> editActivity(Activity activity) async {
    try {
      await _activities.doc(activity.id).update(activity.toJson());
    } catch (e) {
      throw ServerException();
    }
  }
}

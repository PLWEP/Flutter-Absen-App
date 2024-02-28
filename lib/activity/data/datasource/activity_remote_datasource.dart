import 'package:absen_app/common/constants.dart';
import 'package:absen_app/common/exception.dart';
import 'package:absen_app/activity/data/model/activity.dart';
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
      throw ServerException(e.toString());
    }
  }

  Future<List<Activity>> fetchUserActivity(String uid) async {
    try {
      return await _activities
          .where('uid', isEqualTo: uid)
          .orderBy('date', descending: true)
          .snapshots()
          .map(
            (event) => event.docs
                .map((e) => Activity.fromJson(e.data() as Map<String, dynamic>))
                .toList(),
          )
          .first;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> deleteActivity(Activity activity) async {
    try {
      await _activities.doc(activity.id).delete();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Activity> getActivityById(String activityId) async {
    try {
      return await _activities
          .doc(activityId)
          .snapshots()
          .map(
            (event) => Activity.fromJson(event.data() as Map<String, dynamic>),
          )
          .first;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> editActivity(Activity activity) async {
    try {
      await _activities.doc(activity.id).update(activity.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

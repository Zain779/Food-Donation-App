import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreManager {
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('food');

  Stream<DateTime> createIntervalStream(Duration interval) {
    return Stream.periodic(interval, (_) => DateTime.now());
  }

  void startUpdateTimer() {
    final intervalStream = createIntervalStream(const Duration(minutes: 15));
    intervalStream.listen((DateTime dateTime) async {
      final fifteenMinutesAgo = dateTime.subtract(const Duration(minutes: 15));

      final snapshot = await collectionRef
          .where('updatedAt', isLessThan: fifteenMinutesAgo)
          .where('status', isEqualTo: 'reserved')
          .get();

      for (final doc in snapshot.docs) {
        await doc.reference.update(
            {'updatedAt': FieldValue.serverTimestamp(), 'status': 'shared'});
      }
    });
  }
}

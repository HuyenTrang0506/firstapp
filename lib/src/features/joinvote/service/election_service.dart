import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:voting_app/src/features/joinvote/data/election.dart';
class ElectionService {
  final CollectionReference _electionsCollection =
      FirebaseFirestore.instance.collection('elections');

  // Thêm một bản ghi mới vào collection "elections"
Future<void> addElection(Election election) async {
    await _electionsCollection.add({
      'title': election.title,
      'description': election.description,
      'startTime': election.startTime,
      'endTime': election.endTime,
      'allowedUsers': election.allowedUsers,
      'candidates': election.candidates,
    });
  }

  // Lấy danh sách các bản ghi từ collection "elections"
  Stream<List<Election>> getElections() {
    return _electionsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Election(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          startTime: doc['startTime'].toDate(),
          endTime: doc['endTime'].toDate(),
          allowedUsers: List<String>.from(doc['allowedUsers']),
          candidates: List<String>.from(doc['candidates']),
        );
      }).toList();
    });
  }

  // Cập nhật một bản ghi trong collection "elections"
  Future<void> updateElection(Election election) async {
    await _electionsCollection.doc(election.id).update({
      'title': election.title,
      'description': election.description,
      'startTime': election.startTime,
      'endTime': election.endTime,
      'allowedUsers': election.allowedUsers,
      'candidates': election.candidates,
    });
  }

  // Xoá một bản ghi khỏi collection "elections"
  Future<void> deleteElection(String id) async {
    await _electionsCollection.doc(id).delete();
  }
}

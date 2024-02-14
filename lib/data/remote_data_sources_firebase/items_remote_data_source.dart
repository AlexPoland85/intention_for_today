import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemsRemoteDataSource {
  Stream<List<ItemsModel>> getItems() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User not logged in');
    }
    try {
      return FirebaseFirestore.instance
          .collection('items')
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return ItemsModel(id: doc.id, items: doc['intention']);
        }).toList();
      });
    } on FirebaseException catch (error) {
      throw Exception(error.message);
    }
  }

  Stream<List<ItemsModel>> getUsersItems() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User not logged in');
    }
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('items')
          .snapshots()
          .map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return ItemsModel(id: doc.id, items: doc['intention']);
        }).toList();
      });
    } on FirebaseException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<void> addUsersItem(String content) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User not logged in');
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('items')
          .add({'intention': content});
    } on FirebaseException catch (error) {
      throw Exception(error.message);
    }
  }

  Future<void> deleteUsersItem(String id) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User not logged in');
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('items')
          .doc(id)
          .delete();
    } on FirebaseException catch (error) {
      throw Exception(error.message);
    }
  }
}

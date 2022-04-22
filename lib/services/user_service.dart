import 'package:cashaam/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IUserService {
  Future<void> createUser({
    required UserModel user,
  });

  Future<UserModel> retrieveUser({
    required String uid,
  });
}

class UserService extends IUserService {
  final CollectionReference _usersColRef =
      FirebaseFirestore.instance.collection('Users');
  final DocumentReference _tableCountsDocRef =
      FirebaseFirestore.instance.collection('Data').doc('tableCounts');

  @override
  Future<void> createUser({required UserModel user}) async {
    try {
      final WriteBatch batch = FirebaseFirestore.instance.batch();
      DocumentReference userDocRef = _usersColRef.doc(user.uid);
      batch.set(userDocRef, user.toMap());
      batch.update(_tableCountsDocRef, {
        'users': FieldValue.increment(1),
      });
      await batch.commit();
      return;
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<UserModel> retrieveUser({required String uid}) async {
    try {
      DocumentSnapshot documentSnapshot = await _usersColRef.doc(uid).get();
      return UserModel.fromDoc(documentSnapshot);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

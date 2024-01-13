import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/model/user_model.dart';
class FireStoreUser {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('Users');
  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _userCollection.doc(userModel.userId).set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async{
    return await _userCollection.doc(uid).get();
  }
}

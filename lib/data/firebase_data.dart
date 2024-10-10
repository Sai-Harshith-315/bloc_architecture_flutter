import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/models/user_model.dart';

class FirebaseData {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//users collection

  Future<void> addUserToFirestore(UserModel userModel) async {
    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .set(userModel.toMap());
  }

  Future<DocumentSnapshot?> fetchUserFromFIrestore(String uId) async {
    try {
      return await firebaseFirestore.collection('users').doc(uId).get();
    } catch (e) {
      print('Error fetching user from Firestore: $e');
      return null;
    }
  }
}

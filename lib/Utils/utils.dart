import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class utils{
  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}

Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getUserFromUid ({required uid}) async{
  final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('id', isEqualTo: uid)
      .get();
  return snapshot.docs;
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SumgetController extends GetxController{
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final userId= FirebaseAuth.instance.currentUser!.uid;

  var newPaid = "0".obs;

  // get paid value
  void sumAndUpdate(
      String docId,
      String StudentId,
      )async{
    final snapshot =await db
        .collection("users")
        .doc(userId)
        .collection("classd")
        .doc(docId)
        .collection("student")
        .doc(StudentId)
        .collection("transacton")
        .get();

    double sumReceive = 0.0;
    double sumSend = 0.0;

    for(var doc in snapshot.docs){
     final data = doc.data();
     final received = double.tryParse(data['recieve']??"0")??0.0;
     final send = double.tryParse(data['send']??"0")??0.0;

     sumReceive += received;
     sumSend += send;
    }
    //calculate new paid
    final calculatedPaid = sumReceive - sumSend;

    //string
    newPaid.value = calculatedPaid.toString();

    //update
    await db
        .collection("users")
        .doc(userId)
        .collection("classd")
        .doc(docId)
        .collection("student")
        .doc(StudentId)
        .update({
      'paid': newPaid.value,
    });
  }
}
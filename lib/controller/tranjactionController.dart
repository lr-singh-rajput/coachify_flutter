import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newfist/Model/TranjactionModel.dart';

class Tranjactioncontroller extends GetxController{
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final userId= FirebaseAuth.instance.currentUser!.uid;

//add tranjaction data
Future<void>addTransaction(
    String docId,
    String StudentId,
    String recive,
    String send,
    String datetime,
    String desc
    )async{
  final docRef = db
      .collection("users")
      .doc(userId)
      .collection("classd")
      .doc(docId)
      .collection("student")
      .doc(StudentId)
      .collection("transacton")
      .doc();

  final newTransaction = TranjactionModel(
    id: docRef.id,
    recieve: recive,
    send: send,
    datetime: datetime,
    des: desc
  );
  try{
    await docRef.set(newTransaction.toJson());
  }catch (e){
    print("Error while add transaction: $e");
  }
}

//retrive data
Stream<List<TranjactionModel>>getTransaction(
    String docId,
    String StudentId,
    ){
  return db
      .collection("users")
      .doc(userId)
      .collection("classd")
      .doc(docId)
      .collection("student")
      .doc(StudentId)
      .collection("transacton")
      .orderBy('datetime',descending: true)
      .snapshots()
      .map((snapshot){
     return snapshot.docs.map((doc){
       return TranjactionModel.fromJson(doc.data());
     }).toList();
  });
}

  //Calculate sum of send and recive (convert String to Double inside fold)
  // Stream<void> calculateSumAndUpdate(
  //     String docId,
  //     String StudentId,
  //
  //     ){
  // return getTransaction(docId, StudentId)
  //       .map((transactions){
  //         double sendSum= 0.0;
  //         double reciveSum = 0.0;
  //
  //         //Loop throw each document in the snapshot
  //         for(var transaction in transactions){
  //
  //
  //           // //safely extract and convert send and recive to double
  //           // double send = double.tryParse(transactions['send']??'0')??0.0;
  //           // double recive = double.tryParse(data['recieve']??'0')??0.0;
  //
  //           sendSum += transaction.send as double;
  //           reciveSum += transaction.recieve as double;
  //         }
  //         //calculate new totalPaid
  //
  //         double newPaid =  reciveSum -  sendSum;
  //
  //         //update newtotal paid
  //
  //         db
  //             .collection("users")
  //             .doc(userId)
  //             .collection("classd")
  //             .doc(docId)
  //             .collection("student")
  //             .doc(StudentId)
  //             .update({
  //           'paid': newPaid,
  //         });
  //       });
  //
  //
  //
  // }

  // double sumSend = transactions.fold(0.0,(sum, transactions){
  //   double sendValue = double.tryParse(transactions.send.toString()) ?? 0.0; // Convert send from String to double
  //   return sum+ sendValue;
  //
  // });
  // double sumRecive = transactions.fold(0.0,(sum, transactions){
  //   double ReciveValue = double.tryParse(transactions.recieve.toString()) ?? 0.0; // Convert send from String to double
  //   return sum+ ReciveValue;
  //
  // });
  //
  // // Calculater the difference
  // double difference = sumRecive - sumSend;




//update code
Future<void>updateTransaction(
    String docId,
    String StudentId,
    String TransactionId,
    String recive,
    String send,
    String datetime,
    String desc
    )async{

  try {
    await  db
        .collection("users")
        .doc(userId)
        .collection("classd")
        .doc(docId)
        .collection("student")
        .doc(StudentId)
        .collection("transacton")
        .doc(TransactionId)
        .update({
      'recieve': recive,
      'send': send,
      'des': desc,

    });
  }catch(e){
    print("Error While Updating Transaction: $e");
  }
}






//detele
Future<void>DeleteTransaction(
    String docId,
    String StudentId,
    String TransactionId,
    )async{
  try{
    await  db
        .collection("users")
        .doc(userId)
        .collection("classd")
        .doc(docId)
        .collection("student")
        .doc(StudentId)
        .collection("transacton")
        .doc(TransactionId)
        .delete();
  }catch (e){
    print("Error While deleting Transaction: $e");
  }
}


}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newfist/Model/StudentModel.dart';

class StudentController extends GetxController{
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser!.uid;


  //add student data
  Future<void>addStudent(
      String docId,
      String names,
      String namef,
      String number,
      String total
      )async{
    final docRef =  db
        .collection("users")
        .doc(userId)
        .collection("classd")
        .doc(docId)
        .collection("student")
        .doc();
        final newStudent = StudentModel(
          id: docRef.id,
          name: names,
          fname: namef,
          total: total,
          number: number,
          paid: "0"
        );

        try{
          await docRef.set(newStudent.toJson());
        }catch (e){
          print("Error while adding data: $e");
        }
  }


// retrive student data
  Stream<List<StudentModel>> getStudent(String docId){
    return db
        .collection("users")
        .doc(userId)
        .collection("classd")
        .doc(docId)
        .collection("student")
        .snapshots()
        .map((snapshot){
          return snapshot.docs.map((doc){
            return StudentModel.fromJson(doc.data());
       }).toList();
    });
  }


 //update student data code
Future<void>updateStudent(
    String docId,
    String StudentId,
    String name,
    String fname,
    String number,
    String total,
    )async{
    try{
      await db
          .collection("users")
          .doc(userId)
          .collection("classd")
          .doc(docId)
          .collection("student")
          .doc(StudentId)
          .update({
        'name': name,
        'fname':fname,
        'number':number,
        'total':total,
      });
    } catch(e){
      print("Error While Updating Student:$e ");
    }
}


// delete Student data

Future<void>DeleteStudent(
    String docId,
    String StudentId
    )async{
    try{

  await db
      .collection("users")
      .doc(userId)
      .collection("classd")
      .doc(docId)
      .collection("student")
      .doc(StudentId)
      .delete();
    }catch (e){
      print("Error While deleting student: $e");
    }
  }


}
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newfist/Model/Classmodel.dart';

class ClassController extends GetxController{
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  final userId = FirebaseAuth.instance.currentUser?.uid;

  RxBool isLoading = false.obs;
  Rx<ClassModel> classstudent = ClassModel().obs;

  @override
  void onInit() async{
    super.onInit();
   // getClassData(context);
  }


  //add data code
  Future<void> addClass(String classnm,String subclassn)async{

   final docRef = db
        .collection("users")
        .doc(userId)
        .collection("classd")
        .doc();

      final newClass = ClassModel(
        id: docRef.id,
        classn: classnm,
        subclass: subclassn,
        total: 0,
        paid: 0,
        due: 0
    );

   //save data to firebase chack
    try{
      await docRef.set(newClass.toJson());
    }catch (e){
      print("Error while adding data: $e");
    }
  }

  //  retrive data code
  Stream<List<ClassModel>> getClassData() {
        return db
        .collection("users")
        .doc(userId)
        .collection("classd")
        .snapshots()
        .map((snapshot){
          return snapshot.docs.map((doc){
            return ClassModel.fromJson(doc.data());
          }).toList();
    });
    //     .then((value)=> {
    //       classstudent.value = ClassModel.fromJson(
    //         value.data()!
    //       ),
    //     }
    // );
  }


  // update class code
  Future<void>updateClass(
      String docId,
      String name,
      String subname
      ) async {

    try {
      await db
          .collection("users")
          .doc(userId)
          .collection("classd")
          .doc(docId)
          .update({
        'classn': name,
        'subclass':subname,
      });
    } catch (e){
     print("Error while updating class: $e");
    }
  }


  // delete class data code
  Future<void>deleteClass(String docId) async{
    try{
      await db
    .collection("users")
    .doc(userId)
    .collection("classd")
    .doc(docId)
    .delete();

    } catch (e){
      print("Error while deleting class: $e");
    }
  }






}
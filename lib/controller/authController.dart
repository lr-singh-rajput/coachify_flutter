import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newfist/Model/UserModel.dart';
import 'package:newfist/activity/homepage.dart';


class AuthController extends GetxController{
  final  auth = FirebaseAuth.instance;
  final  db = FirebaseFirestore.instance;


  //Sign In Method
  Future<void>login(String email, String password,) async{

    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
     //
      print("succses full to login ");

      Get.offAllNamed('/homePage');

    }on FirebaseAuthException catch(e){
      print(e);
    }
  }


  //Sign UP
 Future<void>createUser(String email,String password,String name,String cname,String number,  BuildContext context, )async{
    try{
        await auth.createUserWithEmailAndPassword(email: email, password: password);
       // User? firebaseUser = userCredential.user;
      UserModel user = UserModel(
        id: auth.currentUser!.uid,
        name: name,
        email: email,
        password: password,
        number: number,
        cname:  cname,
      );
      //save user
      await db
            .collection("data")
            .doc(auth.currentUser!.uid)
            .set(user.toJson());
        Get.offAllNamed("/homePage");

    }catch (e){
      print(e);
    }
 }
}
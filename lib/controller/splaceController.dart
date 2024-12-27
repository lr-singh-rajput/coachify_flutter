import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:newfist/activity/homepage.dart';
import 'package:newfist/activity/login_page.dart';

class SplaceController extends GetxController{
  final auth = FirebaseAuth.instance;

  void onInit()async{
    super.onInit();
    await spaceHandler();

  }

  Future<void> spaceHandler()async{
    Future.delayed(Duration(seconds: 3),(){
      if(auth.currentUser == null){
        Get.to(LoginPage());
      }else{
        Get.to(homePage());
      }
    });
  }
}
import 'package:get/get.dart';
import 'package:newfist/activity/detail_tranjaction.dart';
import 'package:newfist/activity/forget_pass.dart';
import 'package:newfist/activity/homepage.dart';
import 'package:newfist/activity/login_page.dart';
import 'package:newfist/activity/ragister_page.dart';
import 'package:newfist/activity/student_detail_page.dart';
import 'package:newfist/activity/student_page.dart';

var pagePath = [
  GetPage(
    name: "/homePage",
    page: ()=> homePage(),
    transition:  Transition.rightToLeft,
    ),
  GetPage(
    name: "/loginPage",
    page: ()=> LoginPage(),
    transition:  Transition.rightToLeft,
    ),
  GetPage(
    name: "/registerPage",
    page: ()=> RagisterPage(),
    transition:  Transition.rightToLeft,
    ),
  GetPage(
    name: "/forgetPage",
    page: ()=> ForgetPass(),
    transition:  Transition.rightToLeft,
    ),
  // GetPage(
  //   name: "/studentPage",
  //   page: ()=> StudentPage(),
  //   transition:  Transition.rightToLeft,
  //   ),



];
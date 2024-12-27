import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newfist/controller/splaceController.dart';

class SpalcePage extends StatelessWidget {
  const SpalcePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    return Scaffold(
      body:  Center(
        child: Card(
            child: Icon(Icons.ac_unit,color: Colors.orangeAccent,size: 82,)
        ),
      ),
    );
  }
}

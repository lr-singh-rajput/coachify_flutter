import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newfist/Model/StudentModel.dart';
import 'package:newfist/controller/studentController.dart';

class UpdateStudent extends StatelessWidget{


  final String docId;
  final String studentId;
  final StudentModel studentData;

  UpdateStudent({
    super.key,
    required this. studentId,
    required this. docId,
    required this. studentData
  });
  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.put(StudentController());


    var  nameupdate = TextEditingController(text: studentData.name);
    var  fathernameupdate = TextEditingController(text: studentData.fname);
    var  numberupdate = TextEditingController(text: studentData.number);
    var  feesupdate = TextEditingController(text:  studentData.total);


    return Scaffold(
      appBar: AppBar(backgroundColor:Colors.orange,title: const Text('Update Student'),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Name Student",style: TextStyle(color: Colors.black,fontSize: 18),),
              ),
              TextField(
                controller: nameupdate,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Enter name',
                  enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2
                    )
                  )
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Father Name ",style: TextStyle(color: Colors.black,fontSize: 18),),
              ),
              TextField(
                controller: fathernameupdate,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Enter Father Name ',
                  enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2
                    )
                  )
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Mobile Number",style: TextStyle(color: Colors.black,fontSize: 18),),
              ),
              TextField(
                controller: numberupdate,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter Number',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Colors.orange,
                            width: 2
                        )
                    )
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Fees",style: TextStyle(color: Colors.black,fontSize: 18),),
              ),
              TextField(
                controller: feesupdate,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter Fees',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(
                            color: Colors.orange,
                            width: 2
                        )
                    )
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){

                    String updateName = nameupdate.text.toString();
                    String updateFather = fathernameupdate.text.toString();
                    String updateNumber = numberupdate.text.toString();
                    String updateFees = feesupdate.text.toString();

                    studentController.updateStudent(docId, studentId, updateName, updateFather, updateNumber, updateFees);


                  },child: const Text('Update',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16),),
                 ),
                ],
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      )
    );
  }

}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newfist/activity/student_detail_page.dart';
import 'package:newfist/controller/studentController.dart';

import '../Model/Classmodel.dart';
import '../controller/classController.dart';
class StudentPage extends StatelessWidget{

  final ClassModel classData;
  final String docId; // document Id for update/delete/add new data
  StudentPage({
    required this.classData,
    required this.docId
  });





  // add student
  TextEditingController addNameS = TextEditingController();
  TextEditingController addFatherN = TextEditingController();
  TextEditingController addNumber = TextEditingController();
  TextEditingController addFees = TextEditingController();



  @override
  Widget build(BuildContext context) {
    ClassController classController = Get.put(ClassController());
    StudentController studentController = Get.put(StudentController());
    final userId = FirebaseAuth.instance.currentUser!.uid;

    //update field data show
    TextEditingController classup = TextEditingController(text: classData.classn.toString());
    TextEditingController subclassup = TextEditingController(text: classData.subclass.toString());



  return Scaffold(
    appBar: AppBar(title: Text(classData.classn.toString()),

      // Update code
      actions:  [
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: InkWell(
         onTap: (){
           showModalBottomSheet(context: context, builder: (context){
             return SizedBox(
               width: 400,
               child: Padding(
                 padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 8.0,bottom: 8.0),
                 child: SingleChildScrollView(
                   scrollDirection: Axis.vertical,
                   child: Column(
                     children: [
                       const SizedBox(height: 50,),
                       const Text('Update Class',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.orange,fontSize: 30),),
                       const SizedBox(height: 90,),
                       const Text('Class Name',style: TextStyle(color: Colors.black,fontSize: 20,),),
                       TextField(
                            controller: classup,
                         keyboardType: TextInputType.text,

                         decoration: InputDecoration(
                             hintText: 'Enter class name',
                             focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(11),
                                 borderSide: const BorderSide(
                                   color: Colors.blue,
                                   width: 2,
                                 )
                             ),
                             enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(11),
                                 borderSide: const BorderSide(
                                     color: Colors.red,
                                     width: 2
                                 )
                             )
                         ),

                       ),
                       const SizedBox(height: 30,),
                       const Text('Sub Name',style: TextStyle(color: Colors.black,fontSize: 20,),),

                       TextField(
                          controller: subclassup,
                         keyboardType: TextInputType.text,
                         decoration: InputDecoration(
                             hintText: 'Enter Sub Name',
                             enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(11),
                                 borderSide: const BorderSide(
                                     color: Colors.red,
                                     width: 2
                                 )
                             ),
                             focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(11),
                                 borderSide: const BorderSide(
                                     color: Colors.blue,
                                     width: 2
                                 )
                             )
                         ),
                       ),

                       const SizedBox(height: 70,),

                       // Update Btn
                       ElevatedButton(onPressed: (){
                        // String Updateclass = subnameUpdate.text.toString();
                        // String Updatesub = subnameUpdate.text.toString();

                         classController.updateClass(docId, classup.text, subclassup.text);

                       }, child: const Text('Update',style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w500)
                         ,),),
                       const SizedBox(height: 200,)
                     ],
                   ),
                 ),
               ),

             );
           });
         },child: const Icon(Icons.edit_note,color: Colors.blue,size: 29,),
       ),
     ),

        // Update code End

        //Delete code
        Padding(
       padding: const EdgeInsets.all(8.0),
       child: InkWell(
         onTap: (){
           showDialog(context: context, builder: (context)=> AlertDialog(
             title: const Text('Delete',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
             contentPadding: const EdgeInsets.all(20),
             content: const Text('You are sure to Delete Class ?',style: TextStyle(color: Colors.red,fontSize: 15),),
             actions: [
               OutlinedButton(onPressed: (){
                classController.deleteClass(docId);
               }, child: const Text('Delete',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
               OutlinedButton(onPressed: (){

               }, child: const Text('Cencel',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
             ],
           ));
         },child: const Icon(Icons.delete_forever,color: Colors.red,size: 29,),
       ),
     )

        //Delete code End

    ],
    backgroundColor: Colors.orange,),
      body: Stack(
        children: [
          Column(
            children: [

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(left: 2.0,top: 12,),
              //       child: Card(
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(11),
              //           child: Container(
              //             height: 70,
              //             width: 110,
              //             color: Colors.orangeAccent,
              //             child: const Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text("Total",
              //                   style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w800),),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Text("Rs.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700,color: Colors.black), ),
              //                     Text("12345678.00",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w700),)
              //                   ],
              //                 )
              //               ],
              //             ),
              //
              //           ),
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 10.0,top: 12,),
              //       child: Card(
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(11),
              //           child: Container(
              //             height: 70,
              //             width: 110,
              //             color: Colors.orangeAccent,
              //             child: const Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text("paid",
              //                   style: TextStyle(fontSize: 14,color: Colors.blue,fontWeight: FontWeight.w800),),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Text("Rs.",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w800,color: Colors.blue), ),
              //                     Text("12345678.00",style: TextStyle(fontSize: 13,color: Colors.blue,fontWeight: FontWeight.w800),)
              //                   ],
              //                 )
              //               ],
              //             ),
              //
              //           ),
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 10.0,top: 12,),
              //       child: Card(
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(11),
              //           child: Container(
              //             height: 70,
              //             width: 110,
              //             color: Colors.orangeAccent,
              //             child: const Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text("Due",
              //                   style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Text("Rs.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.red), ),
              //                     Text("12345678.00",style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold),)
              //                   ],
              //                 )
              //               ],
              //             ),
              //
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // ElevatedButton(onPressed: (){
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) =>  StudentDetailPage()));
              // }, child:const Text("next")),
              Expanded(
                  child: StreamBuilder(
                      stream: studentController.getStudent(docId),
                      builder: (context,snapshot){
                        if (snapshot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        else if (snapshot.hasError){
                          return Center(
                            child: Text("Error: ${snapshot.error}",
                              style: TextStyle(fontSize: 21,color: Colors.red,fontWeight: FontWeight.bold),),);
                        }
                        else if (!snapshot.hasData|| snapshot.data!.isEmpty){
                          return Center(
                            child: Text("No Data Found",
                              style: TextStyle(fontSize: 21,color: Colors.orangeAccent,fontWeight: FontWeight.bold),),);
                        }

                        final students = snapshot.data!;

                        return ListView.builder(
                            itemCount: students.length,
                            itemBuilder: (context ,index){

                              final studentData =  students[index];

                              return Card(
                                margin:  EdgeInsets.all(10),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Text((index+1).toString())
                                  ),
                                  title: Text(studentData.name.toString()),
                                  subtitle: Text(studentData.fname.toString()),
                                  onTap: (){
                                    Get.to(StudentDetailPage(
                                      studentData: studentData,
                                      docId: docId,
                                      studentId: studentData.id.toString()
                                    ));
                                  },
                                ),
                              );
                            }
                        );

                      })
              )
            ],
          ),

          // Add new Student code

          Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(onPressed: (){
                showModalBottomSheet(context: context, builder: (context){
                  return SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 8.0,bottom: 8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const SizedBox(height: 50,),
                            const Text('Add Student',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 30),),
                            const SizedBox(height: 90,),
                            TextField(controller: addNameS,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: 'Enter student Name',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: const BorderSide(
                                          color: Colors.blue,
                                          width: 2
                                      )
                                  )
                              ),
                            ),
                            const SizedBox(height: 30,),
                            TextField(
                              controller: addFatherN,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: 'Enter Father Name',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: const BorderSide(
                                          color: Colors.blue,
                                          width: 2
                                      )
                                  )
                              ),
                            ),
                            const SizedBox(height: 30,),
                            TextField(
                              controller: addNumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'Enter Number',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: const BorderSide(
                                          color: Colors.blue,
                                          width: 2
                                      )
                                  )
                              ),
                            ),
                            const SizedBox(height: 30,),
                            TextField(
                              controller: addFees,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: 'Enter Total fees',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: const BorderSide(
                                          color: Colors.red,
                                          width: 2
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: const BorderSide(
                                          color: Colors.blue,
                                          width: 2
                                      )
                                  )
                              ),
                            ),
                            const SizedBox(height: 70,),

                            // Add Student btn
                            ElevatedButton(onPressed: (){

                              String nameAdd = addNameS.text.toString();
                              String fatherAdd = addFatherN.text.toString();
                              String numberAdd = addNumber.text.toString();
                              String feesAdd = addFees.text.toString();
                              if(nameAdd.isNotEmpty || fatherAdd.isNotEmpty || numberAdd.isNotEmpty||feesAdd.isNotEmpty  ){
                                studentController.addStudent(docId, nameAdd,fatherAdd, addNumber.text, addFees.text);
                              }else{
                                print("all field requerad");
                              }

                            }, child: const Text('Submit',style: TextStyle(color: Colors.blue,decorationColor: Colors.orange ,fontSize: 14,fontWeight: FontWeight.w500)
                              ,),),
                            const SizedBox(height: 200,)
                          ],
                        ),
                      ),
                    ),

                  );
                });
          },
                backgroundColor: Colors.orange, child: Icon(Icons.add,color: Colors.blue,size: 40,),
              ))

          // Add new Student code end

        ]
      ),
  );
  }

}

// final List<Map<String, String>> student = [
//   {
//     'class':'rahul',
//     'sub':'5000'
//   },{
//     'class':'rohan',
//     'sub':'1000'
//   },{
//     'class':'rohit',
//     'sub':'3000 '
//   },{
//     'class':'hariom',
//     'sub':'2365'
//   },{
//     'class':'akash',
//     'sub':'10000'
//   },{
//     'class':'sunil',
//     'sub':'7500'
//   },{
//     'class':'jaypal',
//     'sub':' 5000'
//   },   {
//     'class':'rahul',
//     'sub':'5000'
//   },{
//     'class':'rohan',
//     'sub':'1000'
//   },{
//     'class':'rohit',
//     'sub':'3000 '
//   },{
//     'class':'hariom',
//     'sub':'2365'
//   },{
//     'class':'akash',
//     'sub':'10000'
//   },{
//     'class':'sunil',
//     'sub':'7500'
//   },{
//     'class':'jaypal',
//     'sub':' 5000'
//   },
// ];

//
// ListView.builder(
// itemCount: student.length,
// itemBuilder: (context, index){
// return Card(
// margin: const EdgeInsets.all(10),
// child: ListTile(
// leading: CircleAvatar(
// child: Text('${index +1}'),
// ),
// title: Text(student[index]['class']!),
// subtitle: Text('money:${student[index]['sub']},'),
// ),
// );
// }
// )
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/route_manager.dart';
import 'package:newfist/Model/StudentModel.dart';
import 'package:newfist/Model/TranjactionModel.dart';
import 'package:newfist/activity/detail_tranjaction.dart';
import 'package:newfist/activity/update_student.dart';
import 'package:newfist/controller/studentController.dart';
import 'package:newfist/controller/sumgetController.dart';
import 'package:newfist/controller/tranjactionController.dart';
import 'package:intl/intl.dart';

class StudentDetailPage extends StatelessWidget {

  final StudentModel studentData;
  final String docId;
  final String studentId;


  StudentDetailPage({
    super.key,
    required this.studentData,
    required this.docId,
    required this.studentId,
  });

  StudentController studentController = Get.put(StudentController());
  Tranjactioncontroller tranjactioncontroller = Get.put(
      Tranjactioncontroller());
  SumgetController sumgetController = Get.put(SumgetController());


  @override
  Widget build(BuildContext context) {
    // auto update paid value
    sumgetController.sumAndUpdate(docId, studentId);
    //tranjactioncontroller.calculateSumAndUpdate(docId, studentId);


// add data transaction controller
    TextEditingController addRecive = TextEditingController();
    TextEditingController addSend = TextEditingController();
    TextEditingController addDesc = TextEditingController();

    DateTime date = DateTime.now();

    String formatDate(DateTime dateTime) {
      // Define the desired date format with newline for time
      final DateFormat formatter = DateFormat('dd/MM/yyyy \nhh:mm a');
      return formatter.format(dateTime);
    }


    return Scaffold(
        appBar: AppBar(title: Text(studentData.name.toString(),),
          backgroundColor: Colors.orange,
          actions: [

            //update btn code
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 7.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            UpdateStudent(
                                docId: docId,
                                studentId: studentId,
                                studentData: studentData

                            )));
                  },
                  child: const Icon(
                    Icons.edit_note, color: Colors.blue, size: 30,)),

            ),
            // Delete code
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 7.0),
              child: InkWell(
                  onTap: () {
                    showDialog(context: context, builder: (context) =>
                        AlertDialog(
                          title: const Text('Delete', style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),),
                          contentPadding: const EdgeInsets.all(20),
                          content: const Text(
                            'You are sure to Delete Student ?',
                            style: TextStyle(color: Colors.red, fontSize: 15),),
                          actions: [
                            OutlinedButton(onPressed: () {
                              studentController.DeleteStudent(docId, studentId);
                            }, child: const Text('Delete', style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold),)),
                            OutlinedButton(onPressed: () {

                            }, child: const Text('Cencel', style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),))
                          ],
                        ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 11.0),
                    child: Icon(
                      Icons.delete_forever, color: Colors.red, size: 30,),
                  )),
            ),
          ],),
        body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  const SizedBox(height: 7,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Father Name', style: TextStyle(fontSize: 18),),
                      Text('mahendra singh', style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  const SizedBox(height: 7,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Mobile Nomber', style: TextStyle(fontSize: 18),),
                      Text('1234567890', style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  const SizedBox(height: 20,),

                  Obx(() {
                    return Text("Paid:${sumgetController.newPaid}",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 21),);
                  }),

                  const SizedBox(height: 7,),
                  const Text('Send reminder'),


                  const SizedBox(height: 7,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Entries', style: TextStyle(fontSize: 16),),
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text('Recieve',
                            style: TextStyle(fontSize: 16, color: Colors.blue)),
                      ),
                      Text('Return',
                        style: TextStyle(fontSize: 16, color: Colors.red),),
                    ],
                  ),
                  Expanded(
                      child: StreamBuilder(
                          stream: tranjactioncontroller.getTransaction(
                              docId, studentId),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),);
                            }
                            else if (snapshot.hasError) {
                              return Center(
                                child: Text("Error: ${snapshot.error}",
                                  style: TextStyle(fontSize: 21,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),),);
                            }
                            else
                            if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(
                                child: Text("No Data Found",
                                  style: TextStyle(fontSize: 21,
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.bold),),);
                            }
                            final transactions = snapshot.data!;


                            return ListView.builder(
                                itemCount: transactions.length,
                                itemBuilder: (context, index) {
                                  final transactionData = transactions[index];

                                  // Ensure transactionData.datetime is a DateTime object
                                  DateTime parsedDateTime = DateTime.parse(
                                      transactionData.datetime!);

                                  // Now format the datetime field
                                  String formattedDate = formatDate(
                                      parsedDateTime);
                                  return InkWell(
                                    child: Card(
                                      margin: EdgeInsets.all(8),
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            //Resive and send data show
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceAround,
                                              children: [
                                                //date time
                                                Text(formattedDate,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      color: Colors.blue
                                                  ),
                                                ),

                                                // resive
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    transactionData.recieve
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 20,
                                                        color: Colors.blue
                                                    ),),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    transactionData.send
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 20,
                                                        color: Colors.red
                                                    ),),
                                                ),


                                              ],
                                            ),

                                            SizedBox(height: 8,),

                                            // Desc
                                            Text(
                                              transactionData.des.toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.green),
                                            )
                                          ],
                                        ),
                                      ),

                                    ),
                                    onTap: () {
                                      Get.to(DetailTranjaction(
                                          docId: docId,
                                          studentId: studentId,
                                          transactionId: transactionData.id
                                              .toString(),
                                          transactionData: transactionData
                                      ));
                                    },
                                  );
                                });
                          }
                      )
                  )

                ],
              ),

              // add tranjaction btn code
              Positioned(
                bottom: 10,
                right: 10,
                child: FloatingActionButton(onPressed: () {
                  showModalBottomSheet(context: context, builder: (context) {
                    return SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              const SizedBox(height: 50,),
                              const Text('Add Pement', style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 30),),
                              const SizedBox(height: 90,),
                              TextField(
                                controller: addRecive,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Recive Money',
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
                              TextField(
                                controller: addSend,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Send Money',
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
                                controller: addDesc,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'description',
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

                              // btn submit tranjaction
                              ElevatedButton(onPressed: () {
                                // String reciveAdd = addRecive.text.toString();
                                // String returnAdd = addSend.text.toString();

                                if (addSend.text.isNotEmpty &&
                                    addRecive.text.isNotEmpty) {
                                  tranjactioncontroller.addTransaction(
                                      docId, studentId, addRecive.text,
                                      addSend.text, date.toString(),
                                      addDesc.text);
                                } else {
                                  print("not save data");
                                }
                              },
                                child: const Text('Submit', style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)
                                  ,),),
                              const SizedBox(height: 200,)
                            ],
                          ),
                        ),
                      ),

                    );
                  });
                },
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.add, color: Colors.blue, size: 40,),),
              )

              // add tranjaction code end

            ]
        )
    );
  }

}

//
// ListView.builder(
// itemCount: transactions.length,
// itemBuilder: (context,index){
// final transaction = transactions[index];

// return Card(
// margin: const EdgeInsets.all(8),
// child: Padding(padding: const EdgeInsets.all(16),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
//
//
// //Resive and send
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// //Date and time
// Text(transaction['date'],
// style: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),
// ),
//
// //Resive
// Container(
// // padding: EdgeInsets.all(8),
// child: Text(
// '${transaction['resive']}',
// style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.blue),
// ),
// ),
//
// //Send
// Container(
// padding: const EdgeInsets.all(5),
// child: Text('${transaction['send']}',
// style: const TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.w700),
// ),
// )
// ],
// ),
// const SizedBox(height: 8,),
//
// //Description
// Text(
// transaction['description'],
// style: const TextStyle(fontSize: 15,color: Colors.green),
// )
// ],
// ),
// ),
// );
// },
// )
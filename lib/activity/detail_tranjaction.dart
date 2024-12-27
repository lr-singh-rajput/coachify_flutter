import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newfist/Model/TranjactionModel.dart';

class DetailTranjaction extends StatelessWidget{



  final TranjactionModel transactionData;
  final String docId;
  final String studentId;
  final String transactionId;

  DetailTranjaction({
    super.key,
    required this.docId,
    required this.studentId,
    required this.transactionId,
    required this.transactionData
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController reciveUpdate = TextEditingController();
    TextEditingController returnUpdate = TextEditingController();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,title: const Text('Detail Tranjaction'),),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 70,),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('You Recive money',style: TextStyle(color: Colors.blue,fontSize: 19),),
            Text('343',style: TextStyle(color: Colors.blue,fontSize: 19),),
          ],
        ),
          const SizedBox(height: 30,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('You Return money',style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
              Text('12334.00',style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
            ],
          ),
          const SizedBox(height: 40,),
          const Text("date and time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
          const Text("11/01/2003, 12:15",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black),),
          
          const SizedBox(height: 40,),
          const Text('Description',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          const Text('Fist installment',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          const SizedBox(height: 50,),

          // Update btn
          OutlinedButton(onPressed: (){
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
                        const Text('Update Details',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.orange,fontSize: 30),),
                        const SizedBox(height: 90,),
                        const Text('Recive money',style: TextStyle(color: Colors.black,fontSize: 20,),),
                        TextField(
                          controller: reciveUpdate,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'enter resive money',
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
                        const Text('Retur money',style: TextStyle(color: Colors.black,fontSize: 20,),),

                        TextField(
                          controller: returnUpdate,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Enter Return money',
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

                        //submit btn Update
                        ElevatedButton(onPressed: (){

                          String updateRicive= reciveUpdate.text.toString();
                          String updateRecive= returnUpdate.text.toString();

                        }, child: const Text('Update',style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w500)
                          ,),),
                        const SizedBox(height: 200,)
                      ],
                    ),
                  ),
                ),

              );
            });
          }, child: const Text('Update',style: TextStyle(color: Colors.blue,fontSize: 16,),),
        ),
          const SizedBox(height: 30,),

          // delete btn
          OutlinedButton(onPressed: (){
            showDialog(context: context,
              builder: (context)=> AlertDialog(
                actions: [
                  TextButton(onPressed: (){

                  }, child: const Text('Delete',style: TextStyle(fontSize: 17,color: Colors.red),),

                  ),

                  TextButton(onPressed: (){

                  }, child: const Text('Cancel',style: TextStyle(fontSize: 17,color: Colors.blue),),

                  ),
                ],
                title: const Text('Delete  ',style: TextStyle(color: Colors.red),),
                contentPadding: const EdgeInsets.all(20.0),
                content: const Text('Are you sure to delete Tranjactiom ?',style: TextStyle(fontSize: 15,color: Colors.red),),

              ));
          }, child: const Text('Delete',style: TextStyle(color: Colors.red,fontSize: 16,),),
        )
          

        ],
      ),
    ),
    );
  }
}
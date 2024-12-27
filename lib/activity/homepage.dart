import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newfist/Model/Classmodel.dart';
import 'package:newfist/activity/student_page.dart';
import 'package:newfist/controller/classController.dart';

class homePage extends StatelessWidget {

   homePage({super.key});

  @override
  Widget build(BuildContext context) {
    ClassController classController = Get.put(ClassController());
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final ClassModel classModel;
    final String docId; // document Id for update/delete/add new data



    TextEditingController nameclassinp = TextEditingController();
    TextEditingController subnameinp = TextEditingController();



    final List<Map<String, String>> classarr1 = [
      {
        'class':'11th',
        'sub':'A'
      },{
        'class':'11th',
        'sub':'A Class'
      },{
        'class':'11th',
        'sub':'B class '
      },{
        'class':'10th',
        'sub':'A class'
      },{
        'class':'9th',
        'sub':'A Class'
      },{
        'class':'7th',
        'sub':'A Class'
      },{
        'class':'10th',
        'sub':'B Class'
      },{
        'class':'11th',
        'sub':'C Class'
      },{
        'class':'1th',
        'sub':'A Class'
      },{
        'class':'11th',
        'sub':'A Class'
      },{
        'class':'11th',
        'sub':'B class '
      },{
        'class':'10th',
        'sub':'A class'
      },{
        'class':'9th',
        'sub':'A Class'
      },{
        'class':'7th',
        'sub':'A Class'
      },{
        'class':'10th',
        'sub':'B Class'
      },{
        'class':'11th',
        'sub':'C Class'
      },{
        'class':'1th',
        'sub':'A Class'
      },
    ];


    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 1,),
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
            //             color: Colors.orange,
            //             child: const Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text("Total",
            //                   style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w700),),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Text("Rs.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.black), ),
            //                     Text("12345678.00",style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w600),)
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
            //                   style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.w800),),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Text("Rs.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.blue), ),
            //                     Text("12345678.00",style: TextStyle(fontSize: 12,color: Colors.blue,fontWeight: FontWeight.w600),)
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
            //                   style: TextStyle(fontSize: 15,color: Colors.red,fontWeight: FontWeight.w900),),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Text("Rs.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: Colors.red), ),
            //                     Text("12345678.00",style: TextStyle(fontSize: 12,color: Colors.red,fontWeight: FontWeight.w700),)
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

            Expanded(
                child: userId == null 
                      ? Center( 
                        child:  Text("User not Logged In" , 
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 21),),
                        )
                      : StreamBuilder<List<ClassModel>>(
                            stream: classController.getClassData(),
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
                              
                              // short defind
                              final classes = snapshot.data!;
                              
                              return ListView.builder(
                                  itemCount: classes.length,
                                  itemBuilder: (context, index) {

                                    //short defind
                                    final classData =  classes[index];
                                    
                                    
                                    return Card(
                                      margin: const EdgeInsets.all(10),
                                      child: ListTile(
                                        leading: CircleAvatar( child: Text((index+1).toString())),
                                        title:  Text(classData.classn.toString()),
                                        subtitle: Text(classData.subclass.toString()),
                                        onTap: (){
                                          //navigate to StudentPade
                                          Get.to(StudentPage(
                                                classData: classData,
                                               docId: classData.id.toString()
                                          ));
                                        },
                                      ),
                                    );
                                  } 
                              );
                              
                            }
                      )
            )
          ],
        ),
      ),

      //botton
      floatingActionButton: FloatingActionButton(
        onPressed: (){
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
                      const Text('Add new class',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 30),),
                      const SizedBox(height: 90,),
                      TextField(
                        controller: nameclassinp,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'enter class name',
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
                        controller: subnameinp,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'enter bub name your class',
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
                      ElevatedButton(onPressed: ()async{
                        
                       // print("click the button ");
                        // String classnameAdd = nameclassinp.text.toString();
                        // String subnameAdd= subnameinp.text.toString();

                        await classController.addClass(nameclassinp.text, subnameinp.text);

                      }, child: const Text('Add Class',style: TextStyle(color: Colors.blue,fontSize: 14,fontWeight: FontWeight.w500)
                        ,),),
                      const SizedBox(height: 200,)
                    ],
                  ),
                ),
              ),

            );
          });
        },
        backgroundColor: Colors.orange,child: Icon(Icons.add_outlined,color: Colors.blue,size: 40,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // This trailing comma makes auto-formatting nicer for build methods.
    );;
  }
}

//
// ListView.builder(
// itemCount: classarr1.length,
// itemBuilder: (context, index){
// return Card(
// margin: const EdgeInsets.all(10),
// child: ListTile(
// leading: CircleAvatar(
// child: Text('${index +1}'),
// ),
// title: Text(classarr1[index]['class']!),
// subtitle: Text('subClass:${classarr1[index]['sub']}'),
// ),
// );
// }
// )